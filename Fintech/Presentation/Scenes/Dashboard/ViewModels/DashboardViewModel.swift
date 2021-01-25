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
    @Published var alert = ScoreAlert()
    @Published var isLoading = true

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
                self.isLoading = false
                self.updateScore(score)
                self.saveScoreLog(score)
            case .failure(let error):
                self.isLoading = false
                self.updateAlert(error)
                self.saveErrorLog(error)
            }
        }
    }

    func updateScore(_ entity: ScoreDTO) {
        score = Score(entity: entity)
    }

    func updateAlert(_ error: FetchScoreError) {
        alert = ScoreAlertFactory.make(for: error)
    }
}

// MARK: Log functionality
extension DashboardViewModel {
    func saveScoreLog(_ score: ScoreDTO) {
        guard let value = score.value, let maxValue = score.maxValue else { return }

        let log = LogDTO(
            type: .info,
            description: "A score of \(value) out of \(maxValue) has been fetched"
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
