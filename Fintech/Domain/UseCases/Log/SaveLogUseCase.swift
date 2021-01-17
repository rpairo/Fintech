//
//  SaveLogUseCase.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct SaveLogUseCase: SaveLogUseCaseable {
    // MARK: Properties
    let repository: LogRepositable

    // MARK: Functionality
    func execute(_ log: LogDTO) {
        repository.save(log)
    }
}
