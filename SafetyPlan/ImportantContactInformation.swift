//
//  ImportantContactInformation.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/7/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation

struct ImportantContactInfo {
    var title: String
    var contactNumber: String
}

enum ImportantContactInformation {
    case nationalSuicidePreventionLifeline
    case crisisTextLine
    case localEmergencyLine
    
    var title: String {
        switch self {
        case .localEmergencyLine:
            return "911"
        case .nationalSuicidePreventionLifeline:
            return "National Suicide Prevention Lifeline?"
        case .crisisTextLine:
            return "Crisis Text Line"
        }
    }
    
    var contactNumber: String {
        switch self {
        case .localEmergencyLine:
            return "911"
        case .nationalSuicidePreventionLifeline:
            return "18002738255"
        case .crisisTextLine:
            return "741741"
        }
    }
}
