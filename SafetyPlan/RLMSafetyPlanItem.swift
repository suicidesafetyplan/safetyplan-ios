//
//  RLMSafetyPlanItem.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/20/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

class RLMSafetyPlanItem: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var safetyPlanItemTypeId: Int = 0
    
    var itemType: SafetyPlanItem.ItemType {
        guard let type = SafetyPlanItem.ItemType(rawValue: self.safetyPlanItemTypeId) else { fatalError("Incorrect value stored for property 'safetyPlanItemTypeId' on object: \(self)")}
        return type
    }
}

// MARK: - Mapping Methods
extension RLMSafetyPlanItem: DomainConvertable {
    var asDomain: DomainObject {
        return SafetyPlanItem(rlmItem: self)
    }
}
