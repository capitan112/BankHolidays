//
//  NorthernIrelandViewModel.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 03/10/2021.
//

import Foundation

class NorthernIrelandViewModel: RootViewModel {
    override func getEvents(bankHolidays: UKBankHolidays) -> [Event] {
        return bankHolidays.northernIreland.events
    }
}
