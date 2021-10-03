//
//  RootViewController.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 02/10/2021.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    var events: [Event]?

    var viewModel: RootViewModelType? {
        didSet {
            setupBindings()
        }
    }

    func setupUI(navTitle: String) {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        title = navTitle
    }

    func configTableView(tableView: UITableView) {
        let className = String(describing: EventTableViewCell.self)
        tableView.register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: EventTableViewCell.reuseIdentifierCell)
        tableView.rowHeight = 100.0
        tableView.tableFooterView = UIView()
    }

    func setupBindings() {
        viewModel?.bankHolidays.bind { events in
            if let events = events {
                self.events = events
                self.reloadTableView()
                self.scrollToNextEvent()
            }
        }
    }

    func scrollToNextEvent() {
        let indexToScroll = viewModel?.findIndexOfNextEvent() ?? 0
        let indexPath = IndexPath(row: indexToScroll, section: 0)
        scrollEvent(indexPath: indexPath)
    }

    func scrollEvent(indexPath _: IndexPath) {}
    func reloadTableView() {}
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return events?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = EventTableViewCell.reuseIdentifierCell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EventTableViewCell

        if let event = events?[indexPath.row] {
            let cellEventViewModel = CellEventViewModel(event: event)
            cell.viewModel = cellEventViewModel
        }

        return cell
    }
}
