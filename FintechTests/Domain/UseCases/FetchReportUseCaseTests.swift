//
//  FetchReportUseCaseTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 24/1/21.
//

import XCTest
@testable import Fintech

class FetchReportUseCaseTests: XCTestCase {
    // MARK: Functionality
    func testSuccessResultReceived() {
        let repository = MockReportRepository(error: nil)
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

    func testNetworkErrorResultReceived() {
        let repository = MockReportRepository(error: .network)
        let sut = FetchReportUseCase(repository: repository)

        sut.execute { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssertEqual(error, .network)
            }
        }
    }

    func testUnkownErrorResultReceived() {
        let error = NSError()
        let repository = MockReportRepository(error: .unkown(error))
        let sut = FetchReportUseCase(repository: repository)

        sut.execute { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssertEqual(error, .unkown(error))
            }
        }
    }
}
