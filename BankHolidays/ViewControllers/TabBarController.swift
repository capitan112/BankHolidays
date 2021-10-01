//
//  TabBarController.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        tabBar.layer.masksToBounds = true
        tabBar.barStyle = .black
        tabBar.barTintColor = .white
        tabBar.tintColor = UIColor.orange

        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowOpacity = 1
        tabBar.layer.masksToBounds = false
        self.delegate = self
    }

    var coordinator: TabBarCoordinator?
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item")
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected view controller")
    }
}
