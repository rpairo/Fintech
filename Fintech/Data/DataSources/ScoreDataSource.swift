//
//  ScoreDataSource.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct ScoreDataSource: ScoreDataSourceable {
    // MARK: Properties
    let endpoint = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"

    // MARK: Functionality
    func fetch(completion: @escaping ScoreDataSourceResult) {
        guard let url = URL(string: endpoint) else {
            failCompletion(completion, error: .url)
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                failCompletion(completion, error: .unkown(error))
            }

            guard let data = data else {
                failCompletion(completion, error: .data)
                return
            }

            guard let score = try? JSONDecoder().decode(ScoreEntity.self, from: data) else {
                failCompletion(completion, error: .decoding)
                return
            }

            successCompletion(completion, score: score)
        }.resume()
    }

    func successCompletion(_ completion: @escaping ScoreDataSourceResult, score: ScoreEntity) {
        DispatchQueue.main.async {
            completion(.success(score))
        }
    }

    func failCompletion(_ completion: @escaping ScoreDataSourceResult, error: ScoreDataSourceError) {
        DispatchQueue.main.async {
            completion(.failure(error))
        }
    }
}
