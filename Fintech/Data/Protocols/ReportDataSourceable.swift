//
//  ReportDataSourceable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

// MARK: Error handler
enum ReportDataSourceError: Error {
    case url
    case decoding
    case data
    case unkown(Error)
}

// MARK: Result
typealias ReportDataSourceResult = (Result<ReportEntity, ReportDataSourceError>) -> Void

// MARK: Protocol
protocol ReportDataSourceable {
    func fetch(completion: @escaping ReportDataSourceResult)
}
