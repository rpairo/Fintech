//
//  FetchReportUseCaseable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

// MARK: Error handler
enum FetchReportError: Error {
    case network
    case unkown(Error)
}

extension FetchReportError: Equatable {
    static func == (lhs: FetchReportError, rhs: FetchReportError) -> Bool {
        switch (lhs, rhs) {
        case (.network, .network):
            return true
        case (.unkown, .unkown):
            return true
        default:
            return false
        }
    }
}

// MARK: Result
typealias FetchReportResult = (Result<ReportDTO, FetchReportError>) -> Void

// MARK: Protocol
protocol FetchReportUseCaseable {
    func execute(completion: @escaping FetchReportResult)
}
