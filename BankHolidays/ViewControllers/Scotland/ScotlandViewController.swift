//
//  ScotlandViewController.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import Foundation
import UIKit

class ScotlandViewController: RootViewController, Storyboarded {
    let navTitle = "Scotland"
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(navTitle: navTitle)
        configTableView(tableView: tableView)
        viewModel?.fetchHolidays()
    }

    override func reloadTableView() {
        performUIUpdatesOnMain { [unowned self] in
            self.tableView.reloadData()
        }
    }

    override func scrollEvent(indexPath: IndexPath) {
        performUIUpdatesOnMain { [unowned self] in
            self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
}
