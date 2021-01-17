//
//  ScoreRepository.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct ScoreRepository: ScoreRepositable {
    // MARK: Data Sources
    let dataSource: ScoreDataSourceable

    // MARK: Functionality
    func fetch(completion: @escaping FetchScoreResult) {
        dataSource.fetch { result in
            switch result {
            case .success(let scoreDTO):
                let score = ScoreEntity(
                    score: scoreDTO.score,
                    scoreMax: scoreDTO.scoreMax
                )

                completion(.success(score))
            case .failure(let error):
                completion(.failure(.key(error.localizedDescription)))
            }
        }
    }
}
