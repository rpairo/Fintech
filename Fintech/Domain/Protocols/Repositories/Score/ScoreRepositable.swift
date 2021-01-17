//
//  ScoreRepositable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

protocol ScoreRepositable {
    func fetch(completion: @escaping FetchScoreResult)
}
