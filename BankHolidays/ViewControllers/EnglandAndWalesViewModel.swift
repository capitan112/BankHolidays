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
                self.bankHolidays.value = bankHolidays.englandAndWales.events
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
