//
//  FetchScoreUseCaseable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

enum FetchScoreError: Error {
    case key(String)
}

typealias FetchScoreResult = (Result<ScoreEntity, FetchScoreError>) -> Void

protocol FetchScoreUseCaseable {
    func execute(completion: @escaping FetchScoreResult)
}
