//
//  ReportRepositoryTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import XCTest
@testable import Fintech

class ReportRepositoryTests: XCTestCase {
    // MARK: Functionality
    func testSuccessResultReceived() {
        let dataSource = MockReportDataSource(error: nil)
        let sut = ReportRepository(dataSource: dataSource)

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
        let dataSource = MockReportDataSource(error: .data)
        let sut = ReportRepository(dataSource: dataSource)

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
        let dataSource = MockReportDataSource(error: .decoding)
        let sut = ReportRepository(dataSource: dataSource)

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
        let dataSource = MockReportDataSource(error: .url)
        let sut = ReportRepository(dataSource: dataSource)

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
        let dataSource = MockReportDataSource(error: .unkown(error))
        let sut = ReportRepository(dataSource: dataSource)

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
