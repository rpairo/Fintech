//
//  ScoreDataSourceable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

enum ScoreDataSourceError: Error {
    case url
    case decoding
    case data
    case error
}

typealias ScoreDataSourceResult = (Result<ScoreDTO, ScoreDataSourceError>) -> Void

protocol ScoreDataSourceable {
    func fetch(completion: @escaping ScoreDataSourceResult)
}
