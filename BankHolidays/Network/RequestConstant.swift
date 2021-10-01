//
//  RequestConstant.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

struct RequestConstant {
    enum Server {
        static let APIScheme = "https"
        static let APIHost = "www.gov.uk"
        static let APIPath = "/bank-holidays.json"
    }
}

//https://www.gov.uk/bank-holidays.json
