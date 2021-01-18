//
//  LogRepositable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

protocol LogRepositable {
    func save(_ log: LogDTO)
}
