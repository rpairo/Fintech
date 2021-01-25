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
        let repository = MockScoreRepository(error: nil)
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

    func testNetworkErrorResultReceived() {
        let repository = MockScoreRepository(error: .network)
        let sut = FetchScoreUseCase(repository: repository)

        sut.execute { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssert(error == .network)
            }
        }
    }

    func testUnkownErrorResultReceived() {
        let error = NSError()
        let repository = MockScoreRepository(error: .unkown(error))
        let sut = FetchScoreUseCase(repository: repository)

        sut.execute { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssert(error == .unkown(error))
            }
        }
    }
}
