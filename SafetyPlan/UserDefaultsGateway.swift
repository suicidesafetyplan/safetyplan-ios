//
//  UserDefaultsGateway.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/12/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation

class UserDefaultsGateway {
    
    // TODO: This UserDefaultsGateway is only to be used while we are using UserDefaults as the primary data persistence layer
    // When we move to another, the data should be migrated, and this class should be deprecated
    
    /// Returns all the items of the given type that are saved in the UserDefaults
    /// - Parameter type: The type of item to retrieve
    static func getAllSafetyPlanItems(ofType type: SafetyPlanItem.ItemType) -> [SafetyPlanItem] {
        let userDefaults = UserDefaults.standard
        let keys = (1...9).map { "\(type.userDefaultsBaseKey)\($0)" }
        return keys.compactMap { userDefaults.string(forKey: $0) }.filter { !$0.isEmpty }.map { SafetyPlanItem(name: $0, type: type) }
    }
    
    static func save(safteyPlanItems: [SafetyPlanItem], for type: SafetyPlanItem.ItemType) {
        let userDefaults = UserDefaults.standard
        let keys = (1...9).map { "\(type.userDefaultsBaseKey)\($0)" }
        for key in keys {
            // first clear all of the user default values for the type to save the new set
            userDefaults.removeObject(forKey: "\(key)")
        }
        for (index, item) in safteyPlanItems.enumerated() {
            // Since the index from `.enumerated()` starts at 1, increment by 1 to match the UserDefaults Keys
            userDefaults.set(item.name, forKey: "\(type.userDefaultsBaseKey)\(index + 1)")
        }
    }
}
