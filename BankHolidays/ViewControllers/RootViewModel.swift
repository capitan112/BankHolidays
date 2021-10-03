//
//  RootViewModel.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 03/10/2021.
//

import Foundation

protocol RootViewModelType {
    var bankHolidays: Bindable<[Event]?> { get set }
    func fetchHolidays()
    func findIndexOfNextEvent() -> Int
}

class RootViewModel: RootViewModelType {
    private(set) var dataFetcher: NetworkDataFetcherProtocol!
    var bankHolidays: Bindable<[Event]?> = Bindable(nil)

    init(dataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchHolidays() {
        dataFetcher.fetchHolidays { response in
            switch response {
            case let .success(bankHolidays):
                let events = self.getEvents(bankHolidays: bankHolidays)
                self.bankHolidays.value = self.filter(events: events)
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }

    func findIndexOfNextEvent() -> Int {
        let event = bankHolidays.value?.first { $0.date >= Date() }
        guard let index = bankHolidays.value?.firstIndex(of: event!) else { return 0 }

        return index - 1
    }

    func getEvents(bankHolidays: UKBankHolidays) -> [Event] {
        return bankHolidays.englandAndWales.events
    }

    func filter(events: [Event], by date: String = "2021-01-01") -> [Event] {
        guard let dateToFilter = DateFormatter.yearMonthFormatter.date(from: date) else {
            return events
        }
        var filteredEvents = events.filter { $0.date >= dateToFilter }

        filteredEvents = filteredEvents.sorted(by: {
            $0.date.compare($1.date) == .orderedAscending
        })

        return filteredEvents
    }
}
