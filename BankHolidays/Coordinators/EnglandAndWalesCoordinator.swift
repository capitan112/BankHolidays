//
//  EnglandAndWalesCooedinator.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
import UIKit


final class EnglandAndWalesCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let englandAndWalesController = EnglandAndWalesController.instantiate(storyboardName: "Main")
//        let startViewModel = CharactersViewModel()
//        startViewModel.fetchData()
//        startViewController.viewModel = startViewModel
        
        navigationController.pushViewController(englandAndWalesController, animated: false)
    }
}