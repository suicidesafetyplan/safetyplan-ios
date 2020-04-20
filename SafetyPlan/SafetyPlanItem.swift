//
//  SafetyPlanItem.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/12/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

// Safety Plan Items are any persisted item that is represented by a simple string
// These include Warning Sings, Coping Strategies, Reasons to Live, and Places for Distraction
// Since all these items are saved as strings, it makes sense to have a standard Data structure that represents them.
class SafetyPlanItem: DomainObject {
    @objc enum ItemType: Int, CaseIterable {
        case warningSign = 1
        case copingStrategy = 2
        case reasonToLive = 3
        case placeForDistraction = 4
        case personalContact = 5
        
        // The string key that is used to represent the saved safety plan item in UserDefaults
        var userDefaultsBaseKey: String {
            switch self {
            case .warningSign:
                return "warningsign"
            case .copingStrategy:
                return "coping"
            case .reasonToLive:
                return "reasonstolive"
            case .placeForDistraction:
                return "placesfordistraction"
            case .personalContact:
                // Personal Contact has 2 keys to represent the whole object, take care of this in a separate method
                return ""
            }
        }
    }
    
    var id: UUID
    var name: String = ""
    var type: ItemType
    
    init(name: String, type: ItemType) {
        self.id = UUID()
        self.name = name
        self.type = type
    }
    
    init(rlmItem: RLMSafetyPlanItem) {
        guard let uuid = UUID(uuidString: rlmItem.id) else { fatalError("Improper value set for propery 'id' for object \(rlmItem)")}
        self.id = uuid
        self.name = rlmItem.name
        self.type = rlmItem.itemType
    }
    
    override var asRealm: Object {
        let rlmObject = RLMSafetyPlanItem()
        rlmObject.id = self.id.uuidString
        rlmObject.name = self.name
        rlmObject.safetyPlanItemTypeId = self.type.rawValue
        return rlmObject
    }
}
