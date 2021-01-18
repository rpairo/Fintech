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

    let fetchReportUseCase = FetchReportUseCase(
        repository: ReportRepository(
            dataSource: ReportDataSource()
        )
    )

    // MARK: Scene
    var body: some Scene {
        WindowGroup {
            TabView {
                DashboardView(
                    viewModel: DashboardViewModel(
                        fetchScoreUseCase: fetchScoreUseCase,
                        saveLogUseCase: saveLogUseCase
                    )
                ).tabItem {
                    Text("Dashboard")
                    Image(systemName: "gauge")
                }

                ProfileView(
                    viewModel: ProfileViewModel(
                        fetchReportUseCase: fetchReportUseCase,
                        saveLogUseCase: saveLogUseCase
                    )
                ).tabItem {
                    Text("Profile")
                    Image(systemName: "person.crop.circle.fill")
                }
            }.accentColor(.orange)
        }
    }
}
