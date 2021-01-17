//
//  DashboardViewModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 15/1/21.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    // MARK: Properties
    @Published var score: Int = 0
    @Published var scoreMax: Int = 0
    @Published var scorePercent: Float = 0.0

    // MARK: Functionallity
    func updateScore() {
        score = 514
        scoreMax = 700

        scorePercent = calculatePercent(value: score, maxValue: scoreMax)
    }

    func calculatePercent(value: Int, maxValue: Int) -> Float {
        Float(value) / Float(maxValue)
    }
}
