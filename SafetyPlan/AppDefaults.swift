//
//  AppDefaults.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/18/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation

class AppSetting<T> {
    let key: String
    let defaultValue: T
    
    var value: T {
        get {
            AppSettingsHelper.get(self)
        }
        set {
            AppSettingsHelper.set(newValue, for: self)
        }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

// MARK: - App Settings
// Store all app settings here, so we can keep track of what keys and values we have in user defaults
class AppSettings {
    static let didMigrateUserDefaultsToRealm = AppSetting<Bool>(key: "didMigrateUserDefaultsToRealm", defaultValue: false)
}

class AppSettingsHelper {
    static func get<T>(_ setting: AppSetting<T>) -> T {
        let defaults = UserDefaults.standard
        return defaults.value(forKey: setting.key) as? T ?? setting.defaultValue
    }
    
    static func set<T>(_ value: T?, for setting: AppSetting<T>) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: setting.key)
    }
}
