//
//  SafetyPlanScreenshots.swift
//  SafetyPlanScreenshots
//
//  Created by dani on 1/1/24.
//  Copyright © 2024 MoodTools. All rights reserved.
//

import XCTest

final class SafetyPlanScreenshots: XCTestCase {

 

    // xcodebuild -testLanguage en -scheme SafetyPlan -project ./SafetyPlan.xcodeproj
    // -derivedDataPath '/tmp/SafetyPlanDerivedData/' -destination
    // "platform=iOS Simulator,name=iPhone 13 Pro Max" build test
    // https://blog.winsmith.de/english/ios/2020/04/14/xcuitest-screenshots.html

    var app: XCUIApplication!

    let aList = ["Check", "List", "Factorize", "Randomize", "Next"]

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()

        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--safetyPlanScreenshots")
    }


    func anAction(word: String, myIndex: Int) {
        let tablesQuery = app.tables
        let aThing = tablesQuery.cells.staticTexts[word]
        XCTAssertTrue(aThing.waitForExistence(timeout: 5))
        aThing.tap()
        let firstTextField = app.textFields.firstMatch
        var textToType = ""
        switch word {
            case "Check":
                textToType = "2351"
            case "Factorize":
                textToType = "2350"
            case "List":
                textToType = "1"
            case "Randomize":
                break
            case "Next":
                textToType = "2350"
            default:
                return
        }

        if word != "Randomize" {
            firstTextField.typeText(textToType)
        }

        if word != "Previous" && word != "List" && word != "Next" {
            takeScreenshot(named: "\(myIndex)A-\(word)-Home")
        }


        if word == "Randomize" {
            app.pickerWheels.element.adjust(toPickerWheelValue: "3 digits")
            app.buttons["Create Random Prime"].firstMatch.tap()
            XCTAssertTrue(app.buttons["Done"].firstMatch.waitForExistence(timeout: 5))
            takeScreenshot(named: "\(myIndex)B-\(word)")
            app.buttons["Done"].firstMatch.tap()
            app.navigationBars[word].buttons["SafetyPlan"].tap()
            return
        }

        app.buttons[word].firstMatch.tap()

        if word == "List" {
            let aAlert = app.alerts.firstMatch
            XCTAssertTrue(aAlert.waitForExistence(timeout: 5))
            app.alerts.buttons.firstMatch.tap() // dismiss alert
            XCTAssertTrue(app.textFields.firstMatch.waitForExistence(timeout: 5))
            app.typeText("2350") // second field should have focus, from swift
            takeScreenshot(named: "\(myIndex)B-\(word)")
            app.buttons[word].firstMatch.tap() // tap list butotn
        }

        XCTAssertTrue(app.buttons["Done"].firstMatch.waitForExistence(timeout: 5))

        takeScreenshot(named: "\(myIndex)B-\(word)")

        app.buttons["Done"].firstMatch.tap()
        app.navigationBars[word].buttons["SafetyPlan"].tap()
    }


    func testMakeScreenshots() {
        app.launch()

        // Home
        takeScreenshot(named: "00-Home")

        for (myIndex, aItem) in aList.enumerated() {
            anAction(word: aItem, myIndex: myIndex)
        }
    }


    func takeScreenshot(named name: String) {
        // Take the screenshot
        let fullScreenshot = XCUIScreen.main.screenshot()

        // Create a new attachment to save our screenshot
        // and give it a name consisting of the "named"
        // parameter and the device name, so we can find
        // it later.
        let screenshotAttachment = XCTAttachment(
            uniformTypeIdentifier: "public.png",
            name: "Screenshot-\(UIDevice.current.name)-\(name).png",
            payload: fullScreenshot.pngRepresentation,
            userInfo: nil)

        // Usually Xcode will delete attachments after
        // the test has run; we don't want that!
        screenshotAttachment.lifetime = .keepAlways

        // Add the attachment to the test log,
        // so we can retrieve it later
        add(screenshotAttachment)
    }

}
