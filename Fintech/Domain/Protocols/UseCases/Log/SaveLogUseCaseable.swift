//
//  SaveLogUseCaseable.swift
//  Fintech
//
//  Created by Raúl Pera Pairó on 17/1/21.
//

import Foundation

protocol SaveLogUseCaseable {
    func execute(_ log: LogDTO)
}
