//
//  ViewModelsTest.swift
//  BankHolidaysTests
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

@testable import BankHolidays
import XCTest

enum FetchError: Error {
    case cannotFetchEnglandAndWalesEvents
    case cannotScotlandEvents
    case cannotNorthIrelandEvents
}

class ViewModelsTest: XCTestCase {
    var rootViewModel: RootViewModelType!
    var englandAndWalesViewModel: EnglandAndWalesViewModel!
    var scotlandViewModel: ScotlandViewModel!
    var northIrelandViewModel: NorthernIrelandViewModel!
    var formater: DateFormatter!
    let date = "2021-01-01"

    override func setUpWithError() throws {
        let networkServiceLocal = NetworkServiceLocal(json: bankHolidayaJson)
        let localDataFetcher = NetworkDataFetcher(networkingService: networkServiceLocal)
        rootViewModel = RootViewModel(dataFetcher: localDataFetcher)
        englandAndWalesViewModel = EnglandAndWalesViewModel(dataFetcher: localDataFetcher)
        scotlandViewModel = ScotlandViewModel(dataFetcher: localDataFetcher)
        northIrelandViewModel = NorthernIrelandViewModel(dataFetcher: localDataFetcher)
        formater = DateFormatter.yearMonthFormatter
    }

    override func tearDownWithError() throws {
        rootViewModel = nil
        englandAndWalesViewModel = nil
        scotlandViewModel = nil
        northIrelandViewModel = nil
        formater = nil
    }

    func testRootViewModel() throws {
        rootViewModel.fetchHolidays()

        XCTAssertEqual(rootViewModel.bankHolidays.value?.count, 17)
        XCTAssertEqual(rootViewModel.findIndexOfNextEvent(), 5)
    }

    func testFetchEnglandAndWalesViewModel() throws {
        englandAndWalesViewModel.fetchHolidays()
        guard let englandAndWalesEvens: [Event] = englandAndWalesViewModel.bankHolidays.value else {
            XCTFail()
            return
        }

        XCTAssertEqual(englandAndWalesEvens.count, 17)

        let expectedEvent = Event(title: "New Year’s Day", date: formater.date(from: date) ?? Date(), notes: Notes.empty, bunting: true)
        guard let newYear: Event = englandAndWalesEvens.first else {
            throw FetchError.cannotFetchEnglandAndWalesEvents
        }

        XCTAssertEqual(newYear, expectedEvent)
    }

    func testFetchScotalndViewModel() throws {
        scotlandViewModel.fetchHolidays()
        guard let scotlandEvens: [Event] = scotlandViewModel.bankHolidays.value else {
            XCTFail()
            return
        }

        XCTAssertEqual(scotlandEvens.count, 19)

        let expectedEvent = Event(title: "New Year’s Day", date: formater.date(from: date) ?? Date(), notes: Notes.empty, bunting: true)

        guard let newYear: Event = scotlandEvens.first else {
            throw FetchError.cannotScotlandEvents
        }

        XCTAssertEqual(newYear, expectedEvent)
    }

    func testFetchNorthIrelandViewModel() throws {
        northIrelandViewModel.fetchHolidays()
        guard let northIrelandEvens: [Event] = northIrelandViewModel.bankHolidays.value else {
            XCTFail()
            return
        }

        XCTAssertEqual(northIrelandEvens.count, 21)

        let expectedEvent = Event(title: "New Year’s Day", date: formater.date(from: date) ?? Date(), notes: Notes.empty, bunting: true)

        guard let newYear: Event = northIrelandEvens.first else {
            throw FetchError.cannotNorthIrelandEvents
        }

        XCTAssertEqual(newYear, expectedEvent)
    }
}
