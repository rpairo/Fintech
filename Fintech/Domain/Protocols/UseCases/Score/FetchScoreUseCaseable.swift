//
//  FetchScoreUseCaseable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

// MARK: Error handler
enum FetchScoreError: Error {
    case network
    case unkown(Error)
}

extension FetchScoreError: Equatable {
    static func == (lhs: FetchScoreError, rhs: FetchScoreError) -> Bool {
        switch (lhs, rhs) {
        case (.network, .network):
            return true
        case (.unkown, .unkown):
            return true
        default:
            return false
        }
    }
}

// MARK: Result
typealias FetchScoreResult = (Result<ScoreDTO, FetchScoreError>) -> Void

// MARK: Protocol
protocol FetchScoreUseCaseable {
    func execute(completion: @escaping FetchScoreResult)
}
