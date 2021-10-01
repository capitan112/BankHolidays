//
//  BankHolidays.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

// MARK: - Welcome
struct BankHolidays: Decodable {
    let englandAndWales: Details
    let scotland: Details
    let northernIreland: Details
    
    
    enum CodingKeys: String, CodingKey {
        case englandAndWales = "england-and-wales"
        case scotland
        case northernIreland = "northern-ireland"
    }
}


struct Details: Decodable {
    let events: [Event]
}

// MARK: - Event
struct Event: Decodable {
    let title, date: String
    let notes: Notes
    let bunting: Bool
}

enum Notes: String, Decodable {
    case empty = ""
    case substituteDay = "Substitute day"
}
