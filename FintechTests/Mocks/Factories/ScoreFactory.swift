//
//  ScoreFactory.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

enum ScoreFactory {
    // MARK: Functionality
    static func makeDomainEntity() -> ScoreDTO {
        ScoreDTO(
            value: 500,
            maxValue: 700
        )
    }

    static func makeDataEntity() -> ScoreEntity {
        ScoreEntity()
    }
}
