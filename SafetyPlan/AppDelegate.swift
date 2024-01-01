//
//  AppDelegate.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/18/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        if CommandLine.arguments.contains("--safetyPlanScreenshots") {
            // We are in testing mode, make arrangements if needed
            DispatchQueue.main.async {
                UIView.setAnimationsEnabled(false)
            }

        }

        configureNavigationBar()
        configureTabBar()

        // Run any needed migrations
        RealmMigrationHelper.runMigationsIfNeeded()

        // Check if we need to migrate data from the UserDefaults to Realm
        if !AppSettings.didMigrateUserDefaultsToRealm.value {
            self.migrateUserDefaultsToRealm()
            // update the userDefaults setting so we dont rerun this mirgation
            AppSettings.didMigrateUserDefaultsToRealm.value = true
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    private func configureNavigationBar() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithTransparentBackground()
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBarAppearance.backgroundColor = UIColor(named: "primary")

            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }

    private func configureTabBar() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor.systemBackground
        UITabBar.appearance().standardAppearance = tabBarAppearance

        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
    
    // MARK: - Migration Methods
    private func migrateUserDefaultsToRealm() {
        // loop through all savable types
        for safetyItemType in SafetyPlanItem.ItemType.allCases {
            // Grab the items for that type saved in user defaults
            let items = UserDefaultsGateway.getAllSafetyPlanItems(ofType: safetyItemType)
            // Save the item in Realm, based on the item type it is
            switch safetyItemType {
            case .copingStrategy, .placeForDistraction, .reasonToLive, .warningSign:
                let gateway = SafetyPlanItemGateway()
                for item in items {
                    // save the items into realm
                    gateway.save(item)
                }
            case .personalContact:
                let gateway = PersonalContactGateway()
                for item in items {
                    if let personalContact = item as? PersonalContact {
                        // save the items into realm
                        gateway.save(personalContact)
                    }
                }
            }
        }
    }
}
