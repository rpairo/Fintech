//
//  ScoreErrorModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct ScoreAlert: Equatable {
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

    init(isShowing: Bool, title: String, description: String) {
        self.isShowing = isShowing
        self.title = title
        self.description = description
    }
}
