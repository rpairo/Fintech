//
//  ProfileViewModel.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    // MARK: Properties
    @Published var report = Report()
    @Published var alert = ReportAlert()
    @Published var isLoading = true

    // MARK: UseCases
    let fetchReportUseCase: FetchReportUseCaseable
    let saveLogUseCase: SaveLogUseCaseable

    // MARK: Constructors
    init(fetchReportUseCase: FetchReportUseCaseable, saveLogUseCase: SaveLogUseCaseable) {
        self.fetchReportUseCase = fetchReportUseCase
        self.saveLogUseCase = saveLogUseCase
    }
}

// MARK: Report functionality
extension ProfileViewModel {
    func fetchReport() {
        fetchReportUseCase.execute { result in
            switch result {
            case .success(let report):
                self.isLoading = false
                self.updateReport(report)
                self.saveReportLog(report)
            case .failure(let error):
                self.isLoading = false
                self.updateAlert(error)
                self.saveErrorLog(error)
            }
        }
    }

    func updateReport(_ entity: ReportDTO) {
        report = Report(entity: entity)
    }

    func updateAlert(_ error: FetchReportError) {
        alert = ReportAlertFactory.make(for: error)
    }
}

// MARK: Log functionality
extension ProfileViewModel {
    func saveReportLog(_ report: ReportDTO) {
        guard let client = report.client else { return }

        let log = LogDTO(
            type: .info,
            description: "Report of client \(client) has been fetched."
        )

        saveLogUseCase.execute(log)
    }

    func saveErrorLog(_ error: Error) {
        let log = LogDTO(
            type: .error,
            description: error.localizedDescription
        )

        saveLogUseCase.execute(log)
    }
}
