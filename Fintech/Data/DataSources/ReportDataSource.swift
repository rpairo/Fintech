//
//  ReportDataSource.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

struct ReportDataSource: ReportDataSourceable {
    // MARK: Properties
    let endpoint = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"

    // MARK: Functionality
    func fetch(completion: @escaping ReportDataSourceResult) {
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

            guard let report = try? JSONDecoder().decode(ReportEntity.self, from: data) else {
                failCompletion(completion, error: .decoding)
                return
            }

            successCompletion(completion, report: report)
        }.resume()
    }

    func successCompletion(_ completion: @escaping ReportDataSourceResult, report: ReportEntity) {
        DispatchQueue.main.async {
            completion(.success(report))
        }
    }

    func failCompletion(_ completion: @escaping ReportDataSourceResult, error: ReportDataSourceError) {
        DispatchQueue.main.async {
            completion(.failure(error))
        }
    }
}
