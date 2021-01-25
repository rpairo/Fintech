//
//  MockScoreDataSource.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

struct MockScoreDataSource: ScoreRepositable {
    // MARK: Properties
    let result: Bool
    let entity: ScoreEntity

    // MARK: Constructor
    init(result: Bool) {
        self.result = result
        self.entity = ScoreFactory.makeDataEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping FetchScoreResult) {
        
    }
}
