//
//  DashboardViewModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 15/1/21.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    // MARK: Properties
    @Published var score = ScoreModel()

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
                self.checkFetchScoreError(error)
            }
        }
    }

    func updateScore(_ score: ScoreDTO) {
        self.score = ScoreModel(value: score.value, maxValue: score.maxValue)
    }

    func checkFetchScoreError(_ error: FetchScoreError) {
        switch error {
        case .network:
            break
        case .unkown(let error):
            break
        }
    }
}
