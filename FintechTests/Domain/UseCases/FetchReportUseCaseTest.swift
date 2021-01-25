//
//  FetchReportUseCaseTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 24/1/21.
//

import XCTest
@testable import Fintech

class FetchReportUseCaseTest: XCTestCase {
    // MARK: Functionality
    func testSuccessResultReceived() {
        let repository = MockReportRepository(result: true)
        let sut = FetchReportUseCase(repository: repository)

        sut.execute { result in
            switch result {
            case .success(let entity):
                XCTAssertNotNil(entity)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }

    func testFailureResultReceived() {
        let repository = MockReportRepository(result: false)
        let sut = FetchReportUseCase(repository: repository)

        sut.execute { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssertNotNil(error)
            }
        }
    }
}
