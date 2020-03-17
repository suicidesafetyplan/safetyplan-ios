//
//  PersonalContact.swift
//  Safety Plan
//
//

import Foundation

class PersonalContact: SafetyPlanItem {
    var contactNumber: String
    
    init(name: String, number: String) {
        self.contactNumber = number
        super.init(name: name, type: .personalContact)
    }
}
