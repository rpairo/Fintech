//
//  FetchScoreUseCaseTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import XCTest
@testable import Fintech

class FetchScoreUseCaseTest: XCTestCase {
    // MARK: Functionality
    func testSuccessResultReceived() {
        let repository = MockScoreRepository(result: true)
        let sut = FetchScoreUseCase(repository: repository)

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
        let repository = MockScoreRepository(result: false)
        let sut = FetchScoreUseCase(repository: repository)

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
