//
//  FetchScoreUseCase.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct FetchScoreUseCase: FetchScoreUseCaseable {
    // MARK: Properties
    let repository: ScoreRepositable

    // MARK: Functionality
    func execute(completion: @escaping FetchScoreResult) {
        repository.fetch { completion($0) }
    }
}
