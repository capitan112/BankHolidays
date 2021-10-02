//
//  ViewController.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import UIKit

class EnglandAndWalesController: UIViewController, Storyboarded {
    private let navTitle = "England and Wales"
    @IBOutlet var tableView: UITableView!
    private var events: [Event]?
    private let cellID = EventTableViewCell.reuseIdentifierCell

    var viewModel: EnglandAndWalesViewModelType? {
        didSet {
            setupBindings()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupBindings() {
        viewModel?.bankHolidays.bind { events in
            if let events = events {
                self.events = events
                self.reloadTableView()
            }
        }
    }

    private func reloadTableView() {
        performUIUpdatesOnMain { [unowned self] in
            self.tableView.reloadData()
        }
    }

    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        title = navTitle
    }
}

extension EnglandAndWalesController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return events?.count ?? 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! EventTableViewCell

        if let event = events?[indexPath.row] {
            let cellEventViewModel = CellEventViewModel(event: event)
            cell.viewModel = cellEventViewModel
        }
        
        return cell
    }
}
