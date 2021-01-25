//
//  ReportFactory.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

enum ReportFactory {
    // MARK: Functionality
    static func makeDomainEntity() -> ReportDTO {
        ReportDTO(
            idvStatus: "",
            client: "",
            score: 0,
            maxScore: 0,
            status: "",
            creditUsed: 0,
            nextReport: 0,
            band: 0,
            bandDescription: "",
            defaulted: false,
            sinceDefaulted: 0,
            delinquent: false,
            sinceDelinquent: 0,
            shortDebtAmount: 0,
            shortDebtNonPromotional: 0,
            shortDebtLimit: 0,
            shortDebtUsed: 0,
            longDebtAmount: 0,
            longDebtNonPromotional: 0,
            longDebtLimit: 0,
            longDebtUsed: 0,
            positiveFactors: 0,
            negativeFactors: 0,
            personaType: ""
        )
    }

    static func makeDataEntity() -> ReportEntity {
        ReportEntity()
    }
}
