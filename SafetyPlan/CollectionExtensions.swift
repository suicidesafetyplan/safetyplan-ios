//
//  CollectionExtensions.swift
//  Safety Plan
//
//  Created by Shayne Torres on 4/10/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import RealmSwift

extension List {
    var toArray: [Element] {
        return self.compactMap { $0 }
    }
}

extension Results {
    var toArray: [Element] {
        return self.compactMap { $0 }
    }
}
