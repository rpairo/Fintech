//
//  FintechApp.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 15/1/21.
//

import SwiftUI

@main
struct FintechApp: App {
    // MARK: Use Cases
    let fetchScoreUseCase = FetchScoreUseCase(
        repository: ScoreRepository(
            dataSource: ScoreDataSource()
        )
    )

    let saveLogUseCase = SaveLogUseCase(
        repository: LogRepository(
            dataSource: LogDataSource()
        )
    )

    // MARK: Scene
    var body: some Scene {
        WindowGroup {
            DashboardView(
                viewModel: DashboardViewModel(
                    fetchScoreUseCase: fetchScoreUseCase,
                    saveLogUseCase: saveLogUseCase
                )
            )
        }
    }
}
