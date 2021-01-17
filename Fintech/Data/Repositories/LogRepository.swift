//
//  LogRepository.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct LogRepository: LogRepositable {
    // MARK: Properties
    var dataSource: LogDataSourceable

    // MARK: Functionality
    func save(_ log: LogDTO) {
        dataSource.save(log)
    }
}
