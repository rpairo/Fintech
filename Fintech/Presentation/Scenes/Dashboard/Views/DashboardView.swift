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
                CircleProgressBar(score: $viewModel.score, isLoading: $viewModel.isLoading)
                    .frame(width: 300.0, height: 300.0)
                    .padding(40.0)
            }.onAppear {
                viewModel.fetchScore()
            }

            .alert(isPresented: $viewModel.alert.isShowing) { () -> Alert in
                let button = Alert.Button.destructive(Text("OK"))

                let alert = Alert(
                    title: Text(viewModel.alert.title),
                    message: Text(viewModel.alert.description),
                    dismissButton: button
                )

                return alert
            }

            .navigationTitle("Dashboard")
        }
    }
}
