//
//  TabBarCoordinator.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self

        let englandAndWaleNavigationController = UINavigationController()
        englandAndWaleNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let englandAndWalesCoordinator = EnglandAndWalesCoordinator(navigationController: englandAndWaleNavigationController)
        
        
        let scotlandNavigationController = UINavigationController()
        scotlandNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1
        )
        let scotlandCoordinator = ScotlandCoordinator(navigationController: scotlandNavigationController)

        let northernIrelandNavigationController = UINavigationController()
        northernIrelandNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .history, tag: 2
        )
        let northernIrelandCoordinator = NorthernIrelandCoordinator(navigationController: northernIrelandNavigationController)

        tabBarController.viewControllers = [englandAndWaleNavigationController,
                                            scotlandNavigationController,
                                            northernIrelandNavigationController
                                            ]
        navigationController.pushViewController(tabBarController, animated: false)
        coordinate(to: englandAndWalesCoordinator)
        coordinate(to: scotlandCoordinator)
        coordinate(to: northernIrelandCoordinator)
    }
}
