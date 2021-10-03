//
//  BankHolidays.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

// MARK: - Welcome

struct UKBankHolidays: Decodable, Equatable {
    let englandAndWales: Details
    let scotland: Details
    let northernIreland: Details

    enum CodingKeys: String, CodingKey {
        case englandAndWales = "england-and-wales"
        case scotland
        case northernIreland = "northern-ireland"
    }
}

struct Details: Decodable, Equatable {
    let events: [Event]
}

// MARK: - Event

struct Event: Decodable, Equatable {
    let title: String
    let date: Date
    let notes: Notes
    let bunting: Bool
}

enum Notes: String, Decodable, Equatable {
    case empty = ""
    case substituteDay = "Substitute day"
}
