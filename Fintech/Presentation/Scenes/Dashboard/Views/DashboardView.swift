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
        NavigationView {
            VStack {
                CircleProgressBar(score: $viewModel.score)
                    .frame(width: 300.0, height: 300.0)
                    .padding(40.0)
            }.onAppear {
                viewModel.fetchScore()
            }

            .alert(isPresented: $viewModel.scoreError.isShowing) { () -> Alert in
                let button = Alert.Button.destructive(Text("OK"))

                let alert = Alert(
                    title: Text(viewModel.scoreError.title),
                    message: Text(viewModel.scoreError.description),
                    dismissButton: button
                )

                return alert
            }

            .navigationTitle("Dashboard")
        }
    }
}
