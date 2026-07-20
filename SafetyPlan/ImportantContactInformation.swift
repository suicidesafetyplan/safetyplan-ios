//
//  ImportantContactInformation.swift
//  Safety Plan
//
//

import Foundation

// Emergency and crisis line contact information for the user's region.
// Numbers verified against each service's official listing, July 2026.
struct RegionCrisisInfo {
    let emergencyNumber: String
    let helplineName: String
    let helplineNumber: String
    // Not every region has a dedicated crisis text service; the text row is hidden when these are nil
    let textLineName: String?
    let textLineNumber: String?

    // The crisis info matching the device's region setting, falling back to US numbers
    static var current: RegionCrisisInfo {
        let regionCode: String
        if #available(iOS 16, *) {
            regionCode = Locale.current.region?.identifier ?? "US"
        } else {
            regionCode = Locale.current.regionCode ?? "US"
        }
        return infoByRegion[regionCode] ?? unitedStates
    }

    private static let unitedStates = RegionCrisisInfo(
        emergencyNumber: "911",
        helplineName: "988 Suicide & Crisis Lifeline",
        helplineNumber: "988",
        textLineName: "Crisis Text Line",
        textLineNumber: "741741")

    private static let infoByRegion: [String: RegionCrisisInfo] = [
        "US": unitedStates,
        "AU": RegionCrisisInfo(
            emergencyNumber: "000",
            helplineName: "Lifeline",
            helplineNumber: "131114",
            textLineName: "Lifeline",
            textLineNumber: "0477131114"),
        "CA": RegionCrisisInfo(
            emergencyNumber: "911",
            helplineName: "9-8-8 Suicide Crisis Helpline",
            helplineNumber: "988",
            textLineName: "9-8-8 Suicide Crisis Helpline",
            textLineNumber: "988"),
        "DE": RegionCrisisInfo(
            emergencyNumber: "112",
            helplineName: "TelefonSeelsorge",
            helplineNumber: "08001110111",
            textLineName: nil,
            textLineNumber: nil),
        "GB": RegionCrisisInfo(
            emergencyNumber: "999",
            helplineName: "Samaritans",
            helplineNumber: "116123",
            textLineName: "Shout",
            textLineNumber: "85258"),
        "IE": RegionCrisisInfo(
            emergencyNumber: "112",
            helplineName: "Samaritans",
            helplineNumber: "116123",
            textLineName: "Text About It",
            textLineNumber: "50808"),
        "IN": RegionCrisisInfo(
            emergencyNumber: "112",
            helplineName: "Tele-MANAS",
            helplineNumber: "14416",
            textLineName: nil,
            textLineNumber: nil),
        "NL": RegionCrisisInfo(
            emergencyNumber: "112",
            helplineName: "113 Zelfmoordpreventie",
            helplineNumber: "08000113",
            textLineName: nil,
            textLineNumber: nil),
        "NZ": RegionCrisisInfo(
            emergencyNumber: "111",
            helplineName: "Lifeline Aotearoa",
            helplineNumber: "0800543354",
            textLineName: "Need to Talk? 1737",
            textLineNumber: "1737"),
        "PH": RegionCrisisInfo(
            emergencyNumber: "911",
            helplineName: "NCMH Crisis Hotline",
            helplineNumber: "1553",
            textLineName: nil,
            textLineNumber: nil),
        "SE": RegionCrisisInfo(
            emergencyNumber: "112",
            helplineName: "Mind Självmordslinjen",
            helplineNumber: "90101",
            textLineName: nil,
            textLineNumber: nil),
        "SG": RegionCrisisInfo(
            emergencyNumber: "995",
            helplineName: "Samaritans of Singapore",
            helplineNumber: "1767",
            textLineName: nil,
            textLineNumber: nil),
        "ZA": RegionCrisisInfo(
            emergencyNumber: "10177",
            helplineName: "SADAG Suicide Crisis Helpline",
            helplineNumber: "0800567567",
            textLineName: nil,
            textLineNumber: nil),
    ]
}
