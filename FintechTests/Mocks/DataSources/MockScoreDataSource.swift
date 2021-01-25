//
//  MockScoreDataSource.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

struct MockScoreDataSource: ScoreDataSourceable {
    // MARK: Properties
    let error: ScoreDataSourceError?
    let entity: ScoreEntity

    // MARK: Constructor
    init(error: ScoreDataSourceError?) {
        self.error = error
        self.entity = ScoreFactory.makeDataEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping ScoreDataSourceResult) {
        switch error {
        case .data:
            completion(.failure(.data))
        case .decoding:
            completion(.failure(.decoding))
        case .url:
            completion(.failure(.url))
        case .unkown(let error):
            completion(.failure(.unkown(error)))
        case .none:
            completion(.success(entity))
        }
    }
}
