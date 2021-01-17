//
//  ScoreDataSourceable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

// MARK: Error handler
enum ScoreDataSourceError: Error {
    case url
    case decoding
    case data
    case unkown(Error)
}

// MARK: Result
typealias ScoreDataSourceResult = (Result<ScoreEntity, ScoreDataSourceError>) -> Void

// MARK: Protocol
protocol ScoreDataSourceable {
    func fetch(completion: @escaping ScoreDataSourceResult)
}
