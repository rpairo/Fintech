//
//  ScoreRepositoryTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import XCTest
@testable import Fintech

class ScoreRepositoryTests: XCTestCase {
    // MARK: Functionality
    func testSuccessResultReceived() {
        let dataSource = MockScoreDataSource(error: nil)
        let sut = ScoreRepository(dataSource: dataSource)

        sut.fetch { result in
            switch result {
            case .success(let entity):
                XCTAssertNotNil(entity)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }

    func testDataErrorResultReceived() {
        let dataSource = MockScoreDataSource(error: .data)
        let sut = ScoreRepository(dataSource: dataSource)

        sut.fetch { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssertEqual(error, .network)
            }
        }
    }

    func testDecodingErrorResultReceived() {
        let dataSource = MockScoreDataSource(error: .decoding)
        let sut = ScoreRepository(dataSource: dataSource)

        sut.fetch { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssertEqual(error, .network)
            }
        }
    }

    func testUrlErrorResultReceived() {
        let dataSource = MockScoreDataSource(error: .url)
        let sut = ScoreRepository(dataSource: dataSource)

        sut.fetch { result in
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
        let dataSource = MockScoreDataSource(error: .unkown(error))
        let sut = ScoreRepository(dataSource: dataSource)

        sut.fetch { result in
            switch result {
            case .success(let entity):
                XCTAssertNil(entity)
            case .failure(let error):
                XCTAssertEqual(error, .unkown(error))
            }
        }
    }
}
