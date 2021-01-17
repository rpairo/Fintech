//
//  ContentView.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 15/1/21.
//

import SwiftUI

struct DashboardView: View {
    // MARK: Properties
    @ObservedObject var viewModel: DashboardViewModel

    // MARK: View
    var body: some View {
        VStack {
            CircleProgressBar(
                score: $viewModel.score,
                scoreMax: $viewModel.scoreMax,
                scorePercent: $viewModel.scorePercent
            )
            .frame(width: 300.0, height: 300.0)
            .padding(40.0)
        }.onAppear {
            viewModel.updateScore()
        }
    }
}
