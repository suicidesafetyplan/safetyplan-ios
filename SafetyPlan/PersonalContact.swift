//
//  PersonalContact.swift
//  Safety Plan
//
//

import Foundation
import RealmSwift

class PersonalContact: SafetyPlanItem {
    var contactNumber: String
    
    init(name: String, number: String) {
        self.contactNumber = number
        super.init(name: name, type: .personalContact)
    }
    
    init(contact: RLMPersonalContact) {
        guard let uuid = UUID(uuidString: contact.id) else { fatalError("Improper value stored in property 'id' for object")}
        self.contactNumber = contact.contactNumber
        super.init(name: contact.name, type: .personalContact)
        self.id = uuid
    }
    
    override var asRealm: Object {
        let rlmObject = RLMPersonalContact()
        rlmObject.id = self.id.uuidString
        rlmObject.name = self.name
        rlmObject.contactNumber = self.contactNumber
        return rlmObject
    }
}
