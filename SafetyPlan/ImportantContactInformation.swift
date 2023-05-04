//
//  ImportantContactInformation.swift
//  Safety Plan
//
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
            return "National Suicide Prevention Lifeline"
        case .crisisTextLine:
            return "Crisis Text Line"
        }
    }
    
    var contactNumber: String {
        switch self {
        case .localEmergencyLine:
            return "911"
        case .nationalSuicidePreventionLifeline:
            return "988"
        case .crisisTextLine:
            return "741741"
        }
    }
}
