//
//  ScoreAlertFactory.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation

enum ScoreAlertFactory {
    // MARK: Functionality
    static func make(for error: FetchScoreError) -> ScoreAlert {
        switch error {
        case .network:
            let description = "An error has occurred with the network. Check your data connection."
            let title = "Network error"
            return createAlert(title: title, description: description)
        case .unkown(let error):
            let description = error.localizedDescription
            let title = "Error"
            return createAlert(title: title, description: description)
        }
    }

    private static func createAlert(title: String, description: String) -> ScoreAlert {
        ScoreAlert(isShowing: true, title: title, description: description)
    }
}
