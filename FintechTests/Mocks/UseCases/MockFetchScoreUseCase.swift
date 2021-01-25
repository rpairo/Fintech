//
//  MockFetchScoreUseCase.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

struct MockFetchScoreUseCase: FetchScoreUseCaseable {
    // MARK: Properties
    let error: FetchScoreError?
    let entity: ScoreDTO

    // MARK: Constructor
    init(error: FetchScoreError?) {
        self.error = error
        self.entity = ScoreFactory.makeDomainEntity()
    }

    // MARK: Functionality
    func execute(completion: @escaping FetchScoreResult) {
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
