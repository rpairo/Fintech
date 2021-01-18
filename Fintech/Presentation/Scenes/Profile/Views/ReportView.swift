//
//  ReportView.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 18/1/21.
//

import SwiftUI

struct ReportView: View {
    // MARK: Properties
    @Binding var report: Report

    // MARK: View
    var body: some View {
        Form {
            accountSection
            creditSection
            bandSection
            criminalRecordSection
            shortDebtSection
            longDebtSection
            factorsSection
            personaSection
        }
    }

    var personaSection: some View {
        Section(header: Text("Persona")) {
            if let persona = report.personaType {
                Row(name: "Type", value: "\(persona)")
            }
        }
    }

    var factorsSection: some View {
        Section(header: Text("Score factors")) {
            if let positive = report.positiveFactors {
                Row(name: "Positive", value: "\(positive)")
            }

            if let negative = report.negativeFactors {
                Row(name: "Negative", value: "\(negative)")
            }
        }
    }

    var longDebtSection: some View {
        Section(header: Text("Long term debt")) {
            if let longAmount = report.longDebtAmount {
                Row(name: "Amount", value: "\(longAmount)\(report.currency)")
            }

            if let longPromotional = report.longDebtNonPromotional {
                Row(name: "Non promotional", value: "\(longPromotional)\(report.currency)")
            }

            if let longLimit = report.longDebtLimit {
                Row(name: "Credit limit", value: "\(longLimit)\(report.currency)")
            }

            if let longUsed = report.longDebtUsed {
                Row(name: "Used", value: "\(longUsed)%")
            }
        }
    }

    var shortDebtSection: some View {
        Section(header: Text("Short term debt")) {
            if let shortAmount = report.shortDebtAmount {
                Row(name: "Amount", value: "\(shortAmount)\(report.currency)")
            }

            if let shortPromotional = report.shortDebtNonPromotional {
                Row(name: "Non promotional", value: "\(shortPromotional)\(report.currency)")
            }

            if let shortLimit = report.shortDebtLimit {
                Row(name: "Credit limit", value: "\(shortLimit)\(report.currency)")
            }

            if let shortUsed = report.shortDebtUsed {
                Row(name: "Used", value: "\(shortUsed)%")
            }
        }
    }

    var criminalRecordSection: some View {
        Section(header: Text("Criminal record")) {
            if let defaulted = report.defaulted, let since = report.sinceDefaulted {
                Row(name: "Defaulted", value: "\(defaulted)".capitalized)

                if defaulted {
                    Row(name: "Since", value: "\(since) month")
                }
            }

            if let delinquent = report.delinquent, let since = report.sinceDelinquent {
                Row(name: "Delinquent", value: "\(delinquent)".capitalized)

                if delinquent {
                    Row(name: "Since", value: "\(since) month")
                }
            }
        }
    }

    var creditSection: some View {
        Section(header: Text("Credit")) {
            if let client = report.client {
                Row(name: "Client", value: "\(client)")
            }

            if let score = report.score {
                Row(name: "Score", value: "\(score)")
            }

            if let maxScore = report.maxScore {
                Row(name: "Score Max", value: "\(maxScore)")
            }

            if let status = report.status {
                Row(name: "Status", value: "\(status)")
            }

            if let creditUsed = report.creditUsed {
                Row(name: "Credit used", value: "\(creditUsed)%")
            }

            if let nextReport = report.nextReport {
                Row(name: "Next report", value: "\(nextReport) days")
            }
        }
    }

    var accountSection: some View {
        Section(header: Text("Account")) {
            if let status = report.idvStatus {
                Row(name: "IDV Status", value: "\(status)")
            }
        }
    }

    var bandSection: some View {
        Section(header: Text("Score Band")) {
            if let band = report.band {
                Row(name: "Band", value: "\(band)")
            }

            if let description = report.bandDescription {
                Row(name: "Description", value: "\(description)")
            }
        }
    }
}

private struct Row: View {
    // MARK: Properties
    var name: String
    var value: String

    // MARK: View
    var body: some View {
        HStack {
            Text("\(name)")
            Spacer()
            Text("\(value)")
                .foregroundColor(.gray)
        }
    }
}
