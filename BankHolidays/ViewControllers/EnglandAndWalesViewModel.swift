//
//  EnglandAndWalesViewModel.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation

protocol EnglandAndWalesViewModelType {
    var holidays: Bindable<Details?> { get set }
    func fetchHolidays()
}

class EnglandAndWalesViewModel: EnglandAndWalesViewModelType {
    private(set) var dataFetcher: NetworkDataFetcherProtocol!

    init(dataFetcher: NetworkDataFetcherProtocol = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    var holidays: Bindable<Details?> = Bindable(nil)
    
    func fetchHolidays() {
        dataFetcher.fetchHolidays { [unowned self] response in
            switch response {
            case let .success(bankHolidays):
                self.holidays.value = bankHolidays.englandAndWales
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
}
