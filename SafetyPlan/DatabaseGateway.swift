//
//  DatabaseGateway.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/15/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

protocol DomainConvertable {
    var asDomain: DomainObject { get }
}

protocol RealmConvertable {
    var asRealm: Object { get }
}


/// This protocol will be the template used when we want to query info from the database
protocol DatabaseGateway {
    // There will be 2 associated types, one will represent the Realm Object that is saved in the database
    // the second will represent the domain layer object, which contains the data from the Realm object but is thread safe
    associatedtype RealmType
    associatedtype DomainType
}

// Basic Database methods for the gateways
extension DatabaseGateway where RealmType: Object, DomainType: DomainObject {
    
    /// Saves the given domain object as its respective Realm Object in the Database
    /// - Parameter domainObject: the domain object to be saved
    func save(_ domainObject: DomainType) {
        do {
            let realm = try? Realm()
            try realm?.write {
                realm?.add(domainObject.asRealm)
            }
        } catch(let error) {
            print("RLM Save Error: \(error)")
        }
    }
    
    /// Returns all the saved data for the respective DomainType, by querying the Realm database and transforming them into domain objects
    func getAll() -> [DomainType] {
        let realm = try? Realm()
        return realm?.objects(RealmType.self).toArray.compactMap { ($0 as? DomainConvertable)?.asDomain }.compactMap { $0 as? DomainType } ?? []
    }
    
    /// Returns all the saved data for the respective DomainType, by querying the Realm database and transforming them into domain objects, while applying a filter
    /// - Parameter string: The filter string to be applied to the database query
    func getAll(filterBy string: String) -> [DomainType] {
        let realm = try? Realm()
        return realm?.objects(RealmType.self).filter(string).toArray.compactMap { ($0 as? DomainConvertable)?.asDomain }.compactMap { $0 as? DomainType } ?? []
    }
}
