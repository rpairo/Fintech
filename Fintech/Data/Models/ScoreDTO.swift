//
//  ScoreDTO.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct ScoreDTO: Decodable {
    // MARK: Properties
    let score: Int
    let scoreMin: Int
    let scoreMax: Int
    let status: String
    let client: String

    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case score
        case scoreMin = "minScoreValue"
        case scoreMax = "maxScoreValue"
        case status = "accountIDVStatus"
        case client = "clientRef"
        case report = "creditReportInfo"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try container.decode(String.self, forKey: .status)

        let report = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .report)
        score = try report.decode(Int.self, forKey: .score)
        scoreMin = try report.decode(Int.self, forKey: .scoreMin)
        scoreMax = try report.decode(Int.self, forKey: .scoreMax)
        client = try report.decode(String.self, forKey: .client)
    }
}
