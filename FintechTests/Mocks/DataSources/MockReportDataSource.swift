//
//  MockReportDataSource.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

struct MockReportDataSource: ReportDataSourceable {
    // MARK: Properties
    let error: ReportDataSourceError?
    let entity: ReportEntity

    // MARK: Constructor
    init(error: ReportDataSourceError?) {
        self.error = error
        self.entity = ReportFactory.makeDataEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping ReportDataSourceResult) {
        switch error {
        case .data:
            completion(.failure(.data))
        case .decoding:
            completion(.failure(.decoding))
        case .url:
            completion(.failure(.url))
        case .unkown(let error):
            completion(.failure(.unkown(error)))
        case .none:
            completion(.success(entity))
        }
    }
}
