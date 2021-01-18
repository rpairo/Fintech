//
//  ScoreErrorModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct ScoreAlert {
    // MARK: Properties
    var isShowing: Bool
    var title: String
    var description: String

    // MARK: Constructors
    init() {
        self.isShowing = false
        self.title = "Error"
        self.description = "An error has occurred"
    }

    init(showing: Bool, title: String, description: String) {
        self.isShowing = showing
        self.title = title
        self.description = description
    }
}
