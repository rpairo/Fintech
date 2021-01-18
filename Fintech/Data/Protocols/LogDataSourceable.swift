//
//  LogDataSourceable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

protocol LogDataSourceable {
    func save(_ log: LogDTO)
}
