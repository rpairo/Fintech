//
//  DashboardViewModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 15/1/21.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    // MARK: Properties
    @Published var score = Score()
    @Published var scoreError = ScoreAlert()

    // MARK: UseCases
    let fetchScoreUseCase: FetchScoreUseCaseable
    let saveLogUseCase: SaveLogUseCaseable

    // MARK: Constructors
    init(fetchScoreUseCase: FetchScoreUseCaseable, saveLogUseCase: SaveLogUseCaseable) {
        self.fetchScoreUseCase = fetchScoreUseCase
        self.saveLogUseCase = saveLogUseCase
    }
}

// MARK: Score functionality
extension DashboardViewModel {
    func fetchScore() {
        fetchScoreUseCase.execute { result in
            switch result {
            case .success(let score):
                self.updateScore(score)
                self.saveScoreLog(score)
            case .failure(let error):
                self.checkFetchScoreError(error)
                self.saveErrorLog(error)
            }
        }
    }

    func updateScore(_ score: ScoreDTO) {
        self.score = Score(value: score.value, maxValue: score.maxValue)
    }

    func checkFetchScoreError(_ error: FetchScoreError) {
        switch error {
        case .network:
            createScoreAlert(
                show: true,
                title: "Network error",
                description: "An error has occurred with the network. Check your data connection."
            )
        case .unkown(let error):
            createScoreAlert(
                show: true,
                title: "Error",
                description: error.localizedDescription
            )
        }
    }

    func createScoreAlert(show: Bool, title: String, description: String) {
        scoreError = ScoreAlert(
            showing: show,
            title: title,
            description: description
        )
    }
}

// MARK: Log functionality
extension DashboardViewModel {
    func saveScoreLog(_ score: ScoreDTO) {
        let log = LogDTO(
            type: .info,
            description: "A score of \(score.value) out of \(score.maxValue) has been obtained"
        )

        saveLogUseCase.execute(log)
    }

    func saveErrorLog(_ error: Error) {
        let log = LogDTO(
            type: .error,
            description: error.localizedDescription
        )

        saveLogUseCase.execute(log)
    }
}
