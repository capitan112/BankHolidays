//
//  NetworkServiceLocal.swift
//  BankHolidaysTests
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
@testable import BankHolidays

class NetworkServiceLocal: NetworkProtocol {
    
    private var dataSourceJson: String

    init(json: String) {
        dataSourceJson = json
    }

    func request(completion: @escaping (Result<Data, Error>) -> Void) {
        completion(.success(dataSourceJson.data(using: .utf8)!))
    }
}

