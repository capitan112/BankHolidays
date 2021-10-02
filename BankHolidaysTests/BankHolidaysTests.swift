//
//  BankHolidaysTests.swift
//  BankHolidaysTests
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

@testable import BankHolidays
import XCTest

class BankHolidaysTests: XCTestCase {
    var networkServiceLocal: NetworkServiceLocal!
    var localDataFetcher: NetworkDataFetcher!

    override func setUpWithError() throws {
        networkServiceLocal = NetworkServiceLocal(json: bankHolidayaJson)
        localDataFetcher = NetworkDataFetcher(networkingService: networkServiceLocal)
    }

    override func tearDownWithError() throws {
        networkServiceLocal = nil
        localDataFetcher = nil
    }

    func testEnglandAndWalesEvens() throws {
        localDataFetcher.fetchHolidays(completion: { response in
            switch response {
            case let .success(bankHolidays):
                XCTAssertEqual(bankHolidays.englandAndWales.events.count, 57)
            case let .failure(error):
                debugPrint(error.localizedDescription)
                XCTFail()
            }
        })
    }

    func testScotlandEvens() throws {
        localDataFetcher.fetchHolidays(completion: { response in
            switch response {
            case let .success(bankHolidays):
                XCTAssertEqual(bankHolidays.scotland.events.count, 64)
            case let .failure(error):
                debugPrint(error.localizedDescription)
                XCTFail()
            }
        })
    }

    func testNIrealcnEvens() throws {
        localDataFetcher.fetchHolidays(completion: { response in
            switch response {
            case let .success(bankHolidays):
                XCTAssertEqual(bankHolidays.northernIreland.events.count, 71)
            case let .failure(error):
                debugPrint(error.localizedDescription)
                XCTFail()
            }
        })
    }
}
