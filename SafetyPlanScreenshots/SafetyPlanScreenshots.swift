//
//  SafetyPlanScreenshots.swift
//  SafetyPlanScreenshots
//
//  Created by Daniel Springer on 1/1/24.
//  Copyright © 2024 MoodTools. All rights reserved.
//

import XCTest

final class SafetyPlanScreenshots: XCTestCase {

 

    // xcodebuild -testLanguage en -scheme SafetyPlan -project ./SafetyPlan.xcodeproj
    // -derivedDataPath '/tmp/SafetyPlanDerivedData/' -destination
    // "platform=iOS Simulator,name=iPhone 13 Pro Max" build test
    // https://blog.winsmith.de/english/ios/2020/04/14/xcuitest-screenshots.html

    var app: XCUIApplication!

    let aList = ["Home"]

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
            case "SomePage":
                textToType = "blah"
            default:
                return
        }

        firstTextField.typeText(textToType)

        XCTAssertTrue(app.buttons["Done"].firstMatch.waitForExistence(timeout: 5))

        takeScreenshot(named: "somePage")

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
