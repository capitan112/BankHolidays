//
//  ViewModelsTest.swift
//  BankHolidaysTests
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

@testable import BankHolidays
import XCTest

class ViewModelsTest: XCTestCase {
    var englandAndWalesViewModel: EnglandAndWalesViewModel!

    override func setUpWithError() throws {
        let networkServiceLocal = NetworkServiceLocal(json: bankHolidayaJson)
        let localDataFetcher = NetworkDataFetcher(networkingService: networkServiceLocal)
        englandAndWalesViewModel = EnglandAndWalesViewModel(dataFetcher: localDataFetcher)
    }

    override func tearDownWithError() throws {
        englandAndWalesViewModel = nil
    }

    func testFetchEnglandAndWalesViewModel() throws {
        englandAndWalesViewModel.fetchHolidays()
        guard let englandAndWalesEvens: [Event] = englandAndWalesViewModel.bankHolidays.value else {
            XCTFail()
            return
        }

        XCTAssertEqual(englandAndWalesEvens.count, 57)

        let date = "2016-01-01"
        let formater = DateFormatter.yearMonthFormatter

        let expectedEvent = Event(title: "New Year’s Day", date: formater.date(from: date) ?? Date(), notes: Notes.empty, bunting: true)
        if let newYear: Event = englandAndWalesEvens.first {
            XCTAssertEqual(newYear, expectedEvent)
        } else {
            XCTFail()
        }
    }
}
