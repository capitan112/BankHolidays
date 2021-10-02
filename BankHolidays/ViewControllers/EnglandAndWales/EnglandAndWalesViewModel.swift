//
//  EnglandAndWalesViewModel.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

protocol EnglandAndWalesViewModelType {
    var bankHolidays: Bindable<[Event]?> { get set }
    func fetchHolidays()
}

class EnglandAndWalesViewModel: EnglandAndWalesViewModelType {
    private(set) var dataFetcher: NetworkDataFetcherProtocol!
    var bankHolidays: Bindable<[Event]?> = Bindable(nil)

    init(dataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchHolidays() {
        dataFetcher.fetchHolidays { response in
            switch response {
            case let .success(bankHolidays):
            
                let events = bankHolidays.englandAndWales.events

                self.bankHolidays.value = self.filter(events: events)
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
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
