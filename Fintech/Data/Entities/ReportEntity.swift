//
//  ReportEntity.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

struct ReportEntity {
    // MARK: Properties
    // Account
    let idvStatus: String?

    // Credit
    let client: String?
    let score: Int?
    let maxScore: Int?
    let status: String?
    let creditUsed: Int?
    let nextReport: Int?

    // Score Band
    let band: Int?
    let bandDescription: String?

    // Criminal Record
    let defaulted: Bool?
    let sinceDefaulted: Int?
    let delinquent: Bool?
    let sinceDelinquent: Int?

    // Short Term Debt
    let shortDebtAmount: Int?
    let shortDebtNonPromotional: Int?
    let shortDebtLimit: Int?
    let shortDebtUsed: Int?

    // Long Term Debt
    let longDebtAmount: Int?
    let longDebtNonPromotional: Int?
    let longDebtLimit: Int?
    let longDebtUsed: Int?

    // Score Factors
    let positiveFactors: Int?
    let negativeFactors: Int?

    // Persona
    let personaType: String?

    // MARK: Constructors
    init() {
        idvStatus = ""
        client = ""
        score = 0
        maxScore = 0
        status = ""
        creditUsed = 0
        nextReport = 0
        band = 0
        bandDescription = ""
        defaulted = false
        sinceDefaulted = 0
        delinquent = false
        sinceDelinquent = 0
        shortDebtAmount = 0
        shortDebtNonPromotional = 0
        shortDebtLimit = 0
        shortDebtUsed = 0
        longDebtAmount = 0
        longDebtNonPromotional = 0
        longDebtLimit = 0
        longDebtUsed = 0
        positiveFactors = 0
        negativeFactors = 0
        personaType = ""
    }

    // MARK: Functionality
    func transformToEntity() -> ReportDTO {
        ReportDTO(
            idvStatus: idvStatus,
            client: client,
            score: score,
            maxScore: maxScore,
            status: status,
            creditUsed: creditUsed,
            nextReport: nextReport,
            band: band,
            bandDescription: bandDescription,
            defaulted: defaulted,
            sinceDefaulted: sinceDefaulted,
            delinquent: delinquent,
            sinceDelinquent: sinceDelinquent,
            shortDebtAmount: shortDebtAmount,
            shortDebtNonPromotional: shortDebtNonPromotional,
            shortDebtLimit: shortDebtLimit,
            shortDebtUsed: shortDebtUsed,
            longDebtAmount: longDebtAmount,
            longDebtNonPromotional: longDebtNonPromotional,
            longDebtLimit: longDebtLimit,
            longDebtUsed: longDebtUsed,
            positiveFactors: positiveFactors,
            negativeFactors: negativeFactors,
            personaType: personaType
        )
    }
}

extension ReportEntity: Decodable {
    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case idvStatus = "accountIDVStatus"
        case client = "clientRef"
        case score
        case maxScore = "maxScoreValue"
        case status
        case creditUsed = "percentageCreditUsed"
        case nextReport = "daysUntilNextReport"
        case band = "scoreBand"
        case bandDescription = "equifaxScoreBandDescription"
        case defaulted = "hasEverDefaulted"
        case sinceDefaulted = "monthsSinceLastDefaulted"
        case delinquent = "hasEverBeenDelinquent"
        case sinceDelinquent = "monthsSinceLastDelinquent"
        case shortDebtAmount = "currentShortTermDebt"
        case shortDebtNonPromotional = "currentShortTermNonPromotionalDebt"
        case shortDebtLimit = "currentShortTermCreditLimit"
        case shortDebtUsed = "currentShortTermCreditUtilisation"
        case longDebtAmount = "currentLongTermDebt"
        case longDebtNonPromotional = "currentLongTermNonPromotionalDebt"
        case longDebtLimit = "currentLongTermCreditLimit"
        case longDebtUsed = "currentLongTermCreditUtilisation"
        case positiveFactors = "numPositiveScoreFactors"
        case negativeFactors = "numNegativeScoreFactors"
        case personaType = "personaType"
        case credit = "creditReportInfo"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        idvStatus = try? container?.decode(String.self, forKey: .idvStatus)
        personaType = try? container?.decode(String.self, forKey: .personaType)

        let credit = try? container?.nestedContainer(keyedBy: CodingKeys.self, forKey: .credit)
        client = try? credit?.decode(String.self, forKey: .client)
        score = try? credit?.decode(Int.self, forKey: .score)
        maxScore = try? credit?.decode(Int.self, forKey: .maxScore)
        status = try? credit?.decode(String.self, forKey: .status)
        creditUsed = try? credit?.decode(Int.self, forKey: .creditUsed)
        nextReport = try? credit?.decode(Int.self, forKey: .nextReport)
        band = try? credit?.decode(Int.self, forKey: .band)
        bandDescription = try? credit?.decode(String.self, forKey: .bandDescription)
        defaulted = try? credit?.decode(Bool.self, forKey: .defaulted)
        sinceDefaulted = try? credit?.decode(Int.self, forKey: .sinceDefaulted)
        delinquent = try? credit?.decode(Bool.self, forKey: .delinquent)
        sinceDelinquent = try? credit?.decode(Int.self, forKey: .sinceDelinquent)
        shortDebtAmount = try? credit?.decode(Int.self, forKey: .shortDebtAmount)
        shortDebtNonPromotional = try? credit?.decode(Int.self, forKey: .shortDebtNonPromotional)
        shortDebtLimit = try? credit?.decode(Int.self, forKey: .shortDebtLimit)
        shortDebtUsed = try? credit?.decode(Int.self, forKey: .shortDebtUsed)
        longDebtAmount = try? credit?.decode(Int.self, forKey: .longDebtAmount)
        longDebtNonPromotional = try? credit?.decode(Int.self, forKey: .longDebtNonPromotional)
        longDebtLimit = try? credit?.decode(Int.self, forKey: .longDebtLimit)
        longDebtUsed = try? credit?.decode(Int.self, forKey: .longDebtUsed)
        positiveFactors = try? credit?.decode(Int.self, forKey: .positiveFactors)
        negativeFactors = try? credit?.decode(Int.self, forKey: .negativeFactors)
    }
}
