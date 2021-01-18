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
            case .success(let score):
                let entity = score.transformToEntity()
                completion(.success(entity))
            case .failure(let error):
                transformDataSourceError(error, completion)
            }
        }
    }

    func transformDataSourceError(_ error: ScoreDataSourceError, _ completion: @escaping FetchScoreResult) {
        switch error {
        case .url, .data, .decoding:
            completion(.failure(.network))
        case .unkown:
            completion(.failure(.unkown(error)))
        }
    }
}
