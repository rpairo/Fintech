//
//  ProfileView.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import SwiftUI

struct ProfileView: View {
    // MARK: Properties
    @ObservedObject var viewModel: ProfileViewModel

    // MARK: View
    var body: some View {
        NavigationView {
            ZStack {
                ReportView(report: $viewModel.report)
                    .onAppear {
                        viewModel.fetchReport()
                    }

                if viewModel.isLoading {
                    progressView
                }
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

            .navigationTitle("Profile")
        }
    }

    var progressView: some View {
        ZStack {
            VisualEffectView(effect: UIBlurEffect(style: .light))
                .edgesIgnoringSafeArea(.all)

            ProgressView("Loading")
                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                .foregroundColor(.black)
        }
    }
}

// MARK: Visual effect
private struct VisualEffectView: UIViewRepresentable {
    // MARK: Properties
    var effect: UIVisualEffect?

    // MARK: Functionality
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}
