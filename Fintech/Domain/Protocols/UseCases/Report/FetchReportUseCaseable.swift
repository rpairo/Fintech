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

// MARK: Result
typealias FetchReportResult = (Result<ReportDTO, FetchReportError>) -> Void

// MARK: Protocol
protocol FetchReportUseCaseable {
    func execute(completion: @escaping FetchReportResult)
}
