//
//  ReportRepository.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

struct ReportRepository: ReportRepositable {
    // MARK: Data Sources
    let dataSource: ReportDataSourceable

    // MARK: Functionality
    func fetch(completion: @escaping FetchReportResult) {
        dataSource.fetch { result in
            switch result {
            case .success(let report):
                let entity = report.transformToEntity()
                completion(.success(entity))
            case .failure(let error):
                transformDataSourceError(error, completion)
            }
        }
    }

    func transformDataSourceError(_ error: ReportDataSourceError, _ completion: @escaping FetchReportResult) {
        switch error {
        case .url, .data, .decoding:
            completion(.failure(.network))
        case .unkown:
            completion(.failure(.unkown(error)))
        }
    }
}
