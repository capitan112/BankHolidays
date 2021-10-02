//
//  DateFormatter+Iso8601Full.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

extension DateFormatter {
    static let yearMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_UK_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"

        return formatter
    }()
}
