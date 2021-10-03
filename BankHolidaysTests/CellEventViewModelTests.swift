//
//  CellEventViewModelTests.swift
//  BankHolidaysTests
//
//  Created by Oleksiy Chebotarov on 03/10/2021.
//

@testable import BankHolidays
import XCTest

class CellEventViewModelTests: XCTestCase {
    var formater: DateFormatter!
    var cellViewModel: CellEventViewModel!

    override func setUpWithError() throws {
        formater = DateFormatter.yearMonthFormatter
    }

    override func tearDownWithError() throws {
        formater = nil
        cellViewModel = nil
    }

    func testNewYear2021EventViewModel() throws {
        let date = "2021-01-01"
        let event = Event(title: "New Year’s Day", date: formater.date(from: date) ?? Date(), notes: Notes.empty, bunting: true)

        cellViewModel = CellEventViewModel(event: event)
        XCTAssertEqual(cellViewModel.day, "01")
        XCTAssertEqual(cellViewModel.month, "Jan 21")
        XCTAssertEqual(cellViewModel.dayOfWeek, "Friday")
        XCTAssertEqual(cellViewModel.title, "New Year’s Day")
        XCTAssertEqual(cellViewModel.notes, "")
        XCTAssertEqual(cellViewModel.isGone, true)
        XCTAssertEqual(cellViewModel.isBunting, true)
    }

    func testNewYear2022EventViewModel() throws {
        let date = "2022-01-01"
        let event = Event(title: "New Year’s Day", date: formater.date(from: date) ?? Date(), notes: Notes.empty, bunting: true)

        cellViewModel = CellEventViewModel(event: event)
        XCTAssertEqual(cellViewModel.day, "01")
        XCTAssertEqual(cellViewModel.month, "Jan 22")
        XCTAssertEqual(cellViewModel.dayOfWeek, "Saturday")
        XCTAssertEqual(cellViewModel.title, "New Year’s Day")
        XCTAssertEqual(cellViewModel.notes, "")
        XCTAssertEqual(cellViewModel.isGone, false)
        XCTAssertEqual(cellViewModel.isBunting, true)
    }
}
