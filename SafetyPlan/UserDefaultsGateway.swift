//
//  UserDefaultsGateway.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/12/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation

class UserDefaultsGateway {
    
    // MARK: - SafetyPlanItem Methods
    // TODO: This UserDefaultsGateway is only to be used while we are using UserDefaults as the primary data persistence layer
    // When we move to another, the data should be migrated, and this class should be deprecated
    
    /// Returns all the items of the given type that are saved in the UserDefaults
    /// - Parameter type: The type of item to retrieve
    static func getAllSafetyPlanItems(ofType type: SafetyPlanItem.ItemType) -> [SafetyPlanItem] {
        let userDefaults = UserDefaults.standard
        if type == .personalContact {
            // if the given type is personal contacts, use the dedicated get contacts method
            return self.getContacts()
        }
        let keys = (1...9).map { "\(type.userDefaultsBaseKey)\($0)" }
        return keys.compactMap { userDefaults.string(forKey: $0) }.filter { !$0.isEmpty }.map { SafetyPlanItem(name: $0, type: type) }
    }
    
    static func save(_ safteyPlanItems: [SafetyPlanItem], for type: SafetyPlanItem.ItemType) {
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
    
    // MARK: - Other Note Methods
    static func save(otherNotes: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(otherNotes, forKey: "other")
    }
    
    static func getOtherNotes() -> String {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: "other") ?? ""
    }
    
    // MARK: - Contact Methods
    /// Constructs and retrieves all the saved contact information
    static func getContacts() -> [PersonalContact] {
        let userDefaults = UserDefaults.standard
        // Retrieve all the saved contacts
        return (1...9).compactMap {
            if let name = userDefaults.string(forKey: "name\($0)") {
                // only grab the contact with a saved non-empty string
                let number = userDefaults.string(forKey: "number\($0)") ?? ""
                return PersonalContact(name: name, number: number)
            }
            return nil
        }
    }
    
    /// Saves the given collection of personal contacts to UserDefaults
    /// - Parameter contacts: The personal contact objects to be saved
    static func save(_ contacts: [PersonalContact]) {
        let userDefaults = UserDefaults.standard
        let nameKeys = (1...9).map { "name\($0)" }
        let numberKeys = (1...9).map { "number\($0)" }
        for (nameKey, numberKey) in zip(nameKeys, numberKeys) {
            // remove all contacts to make room for the newly saved ones
            userDefaults.removeObject(forKey: nameKey)
            userDefaults.removeObject(forKey: numberKey)
        }
        for (index, contact) in contacts.enumerated() {
            // Since we start the count of name and number at 1, increment the index by 1 to match
            userDefaults.set(contact.name, forKey: "name\(index + 1)")
            userDefaults.set(contact.contactNumber, forKey: "number\(index + 1)")
        }
    }
}
