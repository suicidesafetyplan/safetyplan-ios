//
//  RLMPersonalContact.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/20/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

class RLMPersonalContact: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var contactNumber: String = ""
}

// MARK: - Mapping Methods
extension RLMPersonalContact: DomainConvertable {
    var asDomain: DomainObject {
        return PersonalContact(contact: self)
    }
}
