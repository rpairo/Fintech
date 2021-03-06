//
//  ScoreDTO.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

struct ScoreEntity {
    // MARK: Properties
    let value: Int?
    let minValue: Int?
    let maxValue: Int?
    let status: String?
    let client: String?

    // MARK: Constructors
    init() {
        value = 0
        minValue = 0
        maxValue = 0
        status = ""
        client = ""
    }

    // MARK: Functionality
    func transformToEntity() -> ScoreDTO {
        ScoreDTO(value: value, maxValue: maxValue)
    }
}

extension ScoreEntity: Decodable {
    // MARK: Keys
    enum CodingKeys: String, CodingKey {
        case score
        case scoreMin = "minScoreValue"
        case scoreMax = "maxScoreValue"
        case status = "accountIDVStatus"
        case client = "clientRef"
        case credit = "creditReportInfo"
    }

    // MARK: Constructor
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        status = try? container?.decode(String.self, forKey: .status)

        let credit = try? container?.nestedContainer(keyedBy: CodingKeys.self, forKey: .credit)
        value = try? credit?.decode(Int.self, forKey: .score)
        minValue = try? credit?.decode(Int.self, forKey: .scoreMin)
        maxValue = try? credit?.decode(Int.self, forKey: .scoreMax)
        client = try? credit?.decode(String.self, forKey: .client)
    }
}
