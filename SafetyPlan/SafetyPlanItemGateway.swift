//
//  SafetyPlanItemGateway.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/19/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import RealmSwift
import Foundation

/// Gateway for the SafetyPlanItem and RLMSafetyPlanItems
struct SafetyPlanItemGateway: DatabaseGateway {
    typealias RealmType = RLMSafetyPlanItem
    typealias DomainType = SafetyPlanItem
    
    func getAll(forType type: SafetyPlanItem.ItemType) -> [SafetyPlanItem] {
        return self.getAll(filterBy: "safetyPlanItemTypeId = \(type.rawValue)")
    }
    
    /// Clears the database of all objects for the given type and re-seeds the database with the given domain objects
    /// - Parameter items: The domain objects to re-seed the database with
    func replaceAll(with items: [SafetyPlanItem]) {
        do {
            let realm = try? Realm()
            try realm?.write {
                if let item = items.first, let items = realm?.objects(RLMSafetyPlanItem.self).filter("safetyPlanItemTypeId = \(item.type.rawValue)") {
                    realm?.delete(items)
                }
            }
            for item in items {
                save(item)
            }
        } catch(let error) {
            print("RLM Save Error: \(error)")
        }
    }
}

