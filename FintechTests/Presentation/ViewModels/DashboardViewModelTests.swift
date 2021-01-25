//
//  DashboardViewModelTest.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import XCTest
@testable import Fintech

class DashboardViewModelTests: XCTestCase {
    // MARK: Functionality
    func testScoreSuccessResultReceived() {
        // Mocks
        let scoreUseCase = MockFetchScoreUseCase(error: nil)
        let logUseCase = MockSaveLogUseCase()

        // SUT
        let sut = DashboardViewModel(fetchScoreUseCase: scoreUseCase, saveLogUseCase: logUseCase)

        // Expected result
        let score = Score(entity: ScoreFactory.makeDomainEntity())

        // Excpectations
        let scoreExpectation = XCTestExpectation(description: "Score received")

        // Subscriber
        _ = sut.$score.sink { _ in
            scoreExpectation.fulfill()
        }

        sut.fetchScore()

        wait(for: [scoreExpectation], timeout: 5)

        // The updated score is the mocked score
        XCTAssertEqual(sut.score, score)

        // The alert must not change
        XCTAssertEqual(sut.alert, ScoreAlert())

        // Must be false
        XCTAssertFalse(sut.isLoading)

        // Log type must be info
        XCTAssertEqual(logUseCase.log?.type, .info)
    }

    func testScoreNetworkErrorResultReceived() {
        // Mocks
        let scoreUseCase = MockFetchScoreUseCase(error: .network)
        let logUseCase = MockSaveLogUseCase()

        // SUT
        let sut = DashboardViewModel(fetchScoreUseCase: scoreUseCase, saveLogUseCase: logUseCase)

        // Expected result
        let alert = ScoreAlertFactory.make(for: .network)

        // Excpectations
        let scoreExpectation = XCTestExpectation(description: "Score failed")

        // Subscriber
        _ = sut.$alert.sink { _ in
            scoreExpectation.fulfill()
        }

        sut.fetchScore()

        wait(for: [scoreExpectation], timeout: 5)

        // The score must not change
        XCTAssertEqual(sut.score, Score())

        // The updated alert is the mocked alert
        XCTAssertEqual(sut.alert, alert)

        // Must be false
        XCTAssertFalse(sut.isLoading)

        // Log type must be info
        XCTAssertEqual(logUseCase.log?.type, .error)
    }

    func testScoreUnkownErrorResultReceived() {
        // Mocks
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: ""])
        let scoreUseCase = MockFetchScoreUseCase(error: .unkown(error))
        let logUseCase = MockSaveLogUseCase()

        // SUT
        let sut = DashboardViewModel(fetchScoreUseCase: scoreUseCase, saveLogUseCase: logUseCase)

        // Expected result
        let alert = ScoreAlertFactory.make(for: .unkown(error))

        // Excpectations
        let scoreExpectation = XCTestExpectation(description: "Score failed")

        // Subscriber
        _ = sut.$alert.sink { _ in
            scoreExpectation.fulfill()
        }

        sut.fetchScore()

        wait(for: [scoreExpectation], timeout: 5)

        // The score must not change
        XCTAssertEqual(sut.score, Score())

        // The updated alert is the mocked alert
        XCTAssertEqual(sut.alert, alert)

        // Must be false
        XCTAssertFalse(sut.isLoading)

        // Log type must be info
        XCTAssertEqual(logUseCase.log?.type, .error)
    }
}
