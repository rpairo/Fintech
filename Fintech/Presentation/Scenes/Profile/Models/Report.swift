//
//  Report.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

struct Report {
    // MARK: Properties
    var currency = Locale.current.currencySymbol ?? "£"

    // Account
    var idvStatus: String?

    // Credit
    var client: String?
    var score: Int?
    var maxScore: Int?
    var status: String?
    var creditUsed: Int?
    var nextReport: Int?

    // Score Band
    var band: Int?
    var bandDescription: String?

    // Criminal Record
    var defaulted: Bool?
    var sinceDefaulted: Int?
    var delinquent: Bool?
    var sinceDelinquent: Int?

    // Short Term Debt
    var shortDebtAmount: Int?
    var shortDebtNonPromotional: Int?
    var shortDebtLimit: Int?
    var shortDebtUsed: Int?

    // Long Term Debt
    var longDebtAmount: Int?
    var longDebtNonPromotional: Int?
    var longDebtLimit: Int?
    var longDebtUsed: Int?

    // Score Factors
    var positiveFactors: Int?
    var negativeFactors: Int?

    // Persona
    var personaType: String?

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

    init(entity: ReportDTO) {
        idvStatus = entity.idvStatus

        client = entity.client
        score = entity.score
        maxScore = entity.maxScore
        status = entity.status
        creditUsed = entity.creditUsed
        nextReport = entity.nextReport

        band = entity.band
        bandDescription = entity.bandDescription

        defaulted = entity.defaulted
        sinceDefaulted = entity.sinceDefaulted
        delinquent = entity.delinquent
        sinceDelinquent = entity.sinceDelinquent

        shortDebtAmount = entity.shortDebtAmount
        shortDebtNonPromotional = entity.shortDebtNonPromotional
        shortDebtLimit = entity.shortDebtLimit
        shortDebtUsed = entity.shortDebtUsed

        longDebtAmount = entity.longDebtAmount
        longDebtNonPromotional = entity.longDebtNonPromotional
        longDebtLimit = entity.longDebtLimit
        longDebtUsed = entity.longDebtUsed

        positiveFactors = entity.positiveFactors
        negativeFactors = entity.negativeFactors

        personaType = entity.personaType
    }
}
