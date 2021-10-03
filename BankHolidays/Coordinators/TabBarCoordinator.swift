//
//  TabBarCoordinator.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import FlagKit
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

        englandAndWaleNavigationController.tabBarItem = UITabBarItem(title: "England and Wales",
                                                                     image: getFlag(name: "GB-ENG"), tag: 0)

        let englandAndWalesCoordinator = EnglandAndWalesCoordinator(navigationController: englandAndWaleNavigationController)

        let scotlandNavigationController = UINavigationController()
        scotlandNavigationController.tabBarItem = UITabBarItem(title: "Scotland",
                                                               image: getFlag(name: "GB-SCT"),
                                                               tag: 1)
        let scotlandCoordinator = ScotlandCoordinator(navigationController: scotlandNavigationController)

        let northernIrelandNavigationController = UINavigationController()
        northernIrelandNavigationController.tabBarItem = UITabBarItem(title: "Northern Ireland",
                                                                      image: getFlag(name: "GB-NIR"),
                                                                      tag: 2)
        let northernIrelandCoordinator = NorthernIrelandCoordinator(navigationController: northernIrelandNavigationController)

        tabBarController.viewControllers = [englandAndWaleNavigationController,
                                            scotlandNavigationController,
                                            northernIrelandNavigationController]
        navigationController.pushViewController(tabBarController, animated: false)
        coordinate(to: englandAndWalesCoordinator)
        coordinate(to: scotlandCoordinator)
        coordinate(to: northernIrelandCoordinator)
    }

    private func getFlag(name: String) -> UIImage? {
        return Flag(countryCode: name)?.originalImage.withRenderingMode(.alwaysOriginal)
    }
}
