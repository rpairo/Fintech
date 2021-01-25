//
//  ScoreRepositoryMock.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation
@testable import Fintech

struct MockScoreRepository: ScoreRepositable {
    // MARK: Properties
    let error: FetchScoreError?
    let entity: ScoreDTO

    // MARK: Constructor
    init(error: FetchScoreError?) {
        self.error = error
        self.entity = ScoreFactory.makeDomainEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping FetchScoreResult) {
        switch error {
        case .network:
            completion(.failure(.network))
        case .unkown(let error):
            completion(.failure(.unkown(error)))
        case .none:
            completion(.success(entity))
        }
    }
}
