//
//  LogDataSource.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation
import os.log

struct LogDataSource: LogDataSourceable {
    // MARK: Functionality
    func save(_ log: LogDTO) {
        switch log.type {
        case .info:
            os_log(.info, "\(log.description)")
        case .error:
            os_log(.error, "\(log.description)")
        }
    }
}
