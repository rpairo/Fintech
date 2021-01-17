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

    // MARK: UseCases
    let fetchScoreUseCase: FetchScoreUseCaseable

    // MARK: Constructors
    init(fetchScoreUseCase: FetchScoreUseCaseable) {
        self.fetchScoreUseCase = fetchScoreUseCase
    }

    // MARK: Functionallity
    func fetchScore() {
        fetchScoreUseCase.execute { result in
            switch result {
            case .success(let score):
                self.updateScore(score)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func updateScore(_ score: ScoreEntity) {
        self.score = score.score
        self.scoreMax = score.scoreMax
        self.scorePercent = calculatePercent(value: score.score, maxValue: score.scoreMax)
    }

    func calculatePercent(value: Int, maxValue: Int) -> Float {
        Float(value) / Float(maxValue)
    }
}
