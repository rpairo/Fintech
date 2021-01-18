//
//  ReportRepositable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

protocol ReportRepositable {
    func fetch(completion: @escaping FetchReportResult)
}
