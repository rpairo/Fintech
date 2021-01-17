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
                let score = ScoreDTO(
                    value: scoreDTO.value,
                    maxValue: scoreDTO.maxValue
                )

                completion(.success(score))
            case .failure(let error):
                switch error {
                case .url, .data, .decoding:
                    completion(.failure(.network))
                case .unkown:
                    completion(.failure(.unkown(error)))
                }
            }
        }
    }
}
