//
//  ProfileViewModelTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import XCTest
@testable import Fintech

class ProfileViewModelTest: XCTestCase {
    // MARK: Functionality
    func testReportSuccessResultReceived() {
        // Mocks
        let reportUseCase = MockFetchReportUseCase(error: nil)
        let logUseCase = MockSaveLogUseCase()

        // SUT
        let sut = ProfileViewModel(fetchReportUseCase: reportUseCase, saveLogUseCase: logUseCase)

        // Expected result
        let report = Report(entity: ReportFactory.makeDomainEntity())

        // Excpectations
        let reportExpectation = XCTestExpectation(description: "Report received")

        // Subscriber
        _ = sut.$report.sink { _ in
            reportExpectation.fulfill()
        }

        sut.fetchReport()

        wait(for: [reportExpectation], timeout: 5)

        // The updated report is the mocked score
        XCTAssertEqual(sut.report, report)

        // The alert must not change
        XCTAssertEqual(sut.alert, ReportAlert())

        // Must be false
        XCTAssertEqual(sut.isLoading, false)

        // Log type must be info
        XCTAssertEqual(logUseCase.log?.type, .info)
    }

    func testScoreNetworkErrorResultReceived() {
        // Mocks
        let reportUseCase = MockFetchReportUseCase(error: .network)
        let logUseCase = MockSaveLogUseCase()

        // SUT
        let sut = ProfileViewModel(fetchReportUseCase: reportUseCase, saveLogUseCase: logUseCase)

        // Expected result
        let alert = ReportAlertFactory.make(for: .network)

        // Excpectations
        let reportExpectation = XCTestExpectation(description: "Report failed")

        // Subscriber
        _ = sut.$report.sink { _ in
            reportExpectation.fulfill()
        }

        sut.fetchReport()

        wait(for: [reportExpectation], timeout: 5)

        // The score must not change
        XCTAssertEqual(sut.report, Report())

        // The updated alert is the mocked alert
        XCTAssertEqual(sut.alert, alert)

        // Must be false
        XCTAssertEqual(sut.isLoading, false)

        // Log type must be info
        XCTAssertEqual(logUseCase.log?.type, .error)
    }

    func testScoreUnkownErrorResultReceived() {
        // Mocks
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ""])
        let reportUseCase = MockFetchReportUseCase(error: .unkown(error))
        let logUseCase = MockSaveLogUseCase()

        // SUT
        let sut = ProfileViewModel(fetchReportUseCase: reportUseCase, saveLogUseCase: logUseCase)

        // Expected result
        let alert = ReportAlertFactory.make(for: .unkown(error))

        // Excpectations
        let reportExpectation = XCTestExpectation(description: "Report failed")

        // Subscriber
        _ = sut.$report.sink { _ in
            reportExpectation.fulfill()
        }

        sut.fetchReport()

        wait(for: [reportExpectation], timeout: 5)

        // The score must not change
        XCTAssertEqual(sut.report, Report())

        // The updated alert is the mocked alert
        XCTAssertEqual(sut.alert, alert)

        // Must be false
        XCTAssertEqual(sut.isLoading, false)

        // Log type must be info
        XCTAssertEqual(logUseCase.log?.type, .error)
    }
}
