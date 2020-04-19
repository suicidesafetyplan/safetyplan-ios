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

protocol DatabaseGateway {
    associatedtype RealmType
    associatedtype DomainType
}

extension DatabaseGateway where RealmType: Object, DomainType: DomainObject {
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
    
    func replaceAll(with domainObjects: [DomainType]) {
        do {
            let realm = try? Realm()
            try realm?.write {
                if let item = domainObjects.first as? SafetyPlanItem, let items = realm?.objects(RealmType.self).filter("safetyPlanItemTypeId = \(item.type.rawValue)") {
                    realm?.delete(items)
                }
            }
            for object in domainObjects {
                save(object)
            }
        } catch(let error) {
            print("RLM Save Error: \(error)")
        }
    }
    
    func getAll() -> [DomainType] {
        let realm = try? Realm()
        return realm?.objects(RealmType.self).toArray.compactMap { ($0 as? DomainConvertable)?.asDomain }.compactMap { $0 as? DomainType } ?? []
    }
    
    func getAll(filterBy string: String) -> [DomainType] {
        let realm = try? Realm()
        return realm?.objects(RealmType.self).filter(string).toArray.compactMap { ($0 as? DomainConvertable)?.asDomain }.compactMap { $0 as? DomainType } ?? []
    }
}

// Gateways

struct SafetyPlanItemGateway: DatabaseGateway {
    typealias RealmType = RLMSafetyPlanItem
    typealias DomainType = SafetyPlanItem
    
    func getAll(forType type: SafetyPlanItem.ItemType) -> [SafetyPlanItem] {
        return self.getAll(filterBy: "safetyPlanItemTypeId = \(type.rawValue)")
    }
}

struct PersonalContactGateway: DatabaseGateway {
    typealias RealmType = RLMPersonalContact
    typealias DomainType = PersonalContact
}
