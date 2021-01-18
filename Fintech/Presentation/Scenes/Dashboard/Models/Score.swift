//
//  ScoreModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct Score {
    // MARK: Properties
    var value: Int?
    var maxValue: Int?
    var percent: Float

    // MARK: Constructors
    init() {
        self.value = 0
        self.maxValue = 0
        self.percent = 0
    }

    init(value: Int, maxValue: Int) {
        self.value = value
        self.maxValue = maxValue
        self.percent = Float(value) / Float(maxValue)
    }

    init(entity: ScoreDTO) {
        self.value = entity.value
        self.maxValue = entity.maxValue
        self.percent = Float(value ?? 0) / Float(maxValue ?? 0)
    }
}
