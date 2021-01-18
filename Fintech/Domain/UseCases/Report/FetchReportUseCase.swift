//
//  FetchReportUseCase.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

struct FetchReportUseCase: FetchReportUseCaseable {
    // MARK: Properties
    let repository: ReportRepositable

    // MARK: Functionality
    func execute(completion: @escaping FetchReportResult) {
        repository.fetch { completion($0) }
    }
}
