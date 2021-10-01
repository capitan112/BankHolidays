//
//  ScotlandCoordinator.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
import UIKit

final class ScotlandCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let scotlandViewController = ScotlandViewController.instantiate(storyboardName: "Main")
//        let detailsViewModel = DetailsViewModel(character: character)
//        detailsViewController.viewModel = detailsViewModel
        navigationController.pushViewController(scotlandViewController, animated: false)
    }
}
