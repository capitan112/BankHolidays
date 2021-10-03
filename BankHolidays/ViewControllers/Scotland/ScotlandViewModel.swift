//
//  ScotlandViewModel.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 02/10/2021.
//

import Foundation

class ScotlandViewModel: RootViewModel {
    override func getEvents(bankHolidays: UKBankHolidays) -> [Event] {
        return bankHolidays.scotland.events
    }
}
