//
//  ViewController.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import UIKit

class EnglandAndWalesController: UIViewController, Storyboarded {
    
        override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    

    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        view.backgroundColor = .red
        self.title = "England and Weles"
    }
}

