//
//  PersonalContactGateway.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/19/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

/// Gateway for the PersonalContact and RLMPersonalContact
struct PersonalContactGateway: DatabaseGateway {
    typealias RealmType = RLMPersonalContact
    typealias DomainType = PersonalContact
    
    /// Clears the database of all personal contact objects and re-seeds the database with the given domain objects
    /// - Parameter items: The domain objects to re-seed the database with
    func replaceAll(with contacts: [PersonalContact]) {
        do {
            let realm = try? Realm()
            try realm?.write {
                if let deletingItems = realm?.objects(RLMPersonalContact.self) {
                    realm?.delete(deletingItems)
                }
            }
            for contact in contacts {
                save(contact)
            }
        } catch(let error) {
            print("RLM Save Error: \(error)")
        }
    }
}
