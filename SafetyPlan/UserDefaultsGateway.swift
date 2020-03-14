//
//  UserDefaultsGateway.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/12/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation

class UserDefaultsGateway {
    
    /// Returns all the items of the given type that are saved in the UserDefaults
    /// - Parameter type: The type of item to retrieve
    static func getAllSafetyPlanItems(forType type: SafetyPlanItem.ItemType) -> [SafetyPlanItem] {
        let userDefaults = UserDefaults.standard
        let keys = (1...9).map { "\(type.userDefaultsBaseKey)\($0)" }
        return keys.compactMap { userDefaults.string(forKey: $0) }.filter { !$0.isEmpty }.map { SafetyPlanItem(name: $0, type: type) }
    }
}
