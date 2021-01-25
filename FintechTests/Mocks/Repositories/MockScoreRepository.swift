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
    let result: Bool
    let entity: ScoreDTO

    // MARK: Constructor
    init(result: Bool) {
        self.result = result
        self.entity = ScoreFactory.makeDomainEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping FetchScoreResult) {
        if result {
            completion(.success(entity))
        } else {
            completion(.failure(.network))
        }
    }
}
