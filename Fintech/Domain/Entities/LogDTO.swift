//
//  LogDTO.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

enum LogType {
    case info
    case error
}

struct LogDTO {
    // MARK: Properties
    let type: LogType
    let description: String
}
