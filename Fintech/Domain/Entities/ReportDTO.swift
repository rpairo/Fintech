//
//  ReportDTO.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

struct ReportDTO {
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
}
