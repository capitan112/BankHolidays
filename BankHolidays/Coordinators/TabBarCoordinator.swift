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

        let englandAndWalesNavigationController = UINavigationController()
        let englandAndWalesFlag = getFlag(name: "GB-ENG")
        englandAndWalesNavigationController.tabBarItem = UITabBarItem(title: "England and Wales",
                                                                     image: englandAndWalesFlag,
                                                                     tag: 0)

        let englandAndWalesCoordinator = EnglandAndWalesCoordinator(navigationController: englandAndWalesNavigationController)

        let scotlandNavigationController = UINavigationController()
        let scotlandFlag = getFlag(name: "GB-SCT")
        scotlandNavigationController.tabBarItem = UITabBarItem(title: "Scotland",
                                                               image: scotlandFlag,
                                                               tag: 1)
        let scotlandCoordinator = ScotlandCoordinator(navigationController: scotlandNavigationController)

        let northernIrelandNavigationController = UINavigationController()
        let northernIrelandFlag = getFlag(name: "GB-NIR")
        northernIrelandNavigationController.tabBarItem = UITabBarItem(title: "Northern Ireland",
                                                                      image: northernIrelandFlag,
                                                                      tag: 2)
        let northernIrelandCoordinator = NorthernIrelandCoordinator(navigationController: northernIrelandNavigationController)

        tabBarController.viewControllers = [englandAndWalesNavigationController,
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
