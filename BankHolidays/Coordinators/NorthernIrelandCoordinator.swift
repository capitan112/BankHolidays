//
//  NorthernirelandCoordinator.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
import UIKit

final class NorthernIrelandCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let northernIrelandViewController = NorthernIrelandViewController.instantiate(storyboardName: "Main")
        let northernIrelandViewModel = NorthernIrelandViewModel()
        northernIrelandViewController.viewModel = northernIrelandViewModel
        navigationController.pushViewController(northernIrelandViewController, animated: false)
    }
}
