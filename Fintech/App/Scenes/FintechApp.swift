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

    var body: some Scene {
        WindowGroup {
            DashboardView(
                viewModel: DashboardViewModel(
                    fetchScoreUseCase: fetchScoreUseCase
                )
            )
        }
    }
}
