//
//  ReportRepositoryMock.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 24/1/21.
//

import Foundation
@testable import Fintech

struct MockReportRepository: ReportRepositable {
    // MARK: Properties
    let error: FetchReportError?
    let entity: ReportDTO

    // MARK: Constructor
    init(error: FetchReportError?) {
        self.error = error
        self.entity = ReportFactory.makeDomainEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping FetchReportResult) {
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
