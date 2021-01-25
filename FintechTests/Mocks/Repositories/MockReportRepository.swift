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
    let result: Bool
    let entity: ReportDTO

    // MARK: Constructor
    init(result: Bool) {
        self.result = result
        self.entity = ReportFactory.makeDomainEntity()
    }

    // MARK: Functionality
    func fetch(completion: @escaping FetchReportResult) {
        if result {
            completion(.success(entity))
        } else {
            completion(.failure(.network))
        }
    }
}
