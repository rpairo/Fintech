//
//  MockSaveLogUseCase.swift
//  FintechTests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import Foundation
@testable import Fintech

class MockSaveLogUseCase: SaveLogUseCaseable {
    // MARK: Properties
    var log: LogDTO?

    // MARK: Functionality
    func execute(_ log: LogDTO) {
        self.log = log
    }
}
