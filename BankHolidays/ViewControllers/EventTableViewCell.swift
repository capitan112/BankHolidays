//
//  EnglandAndWalesTableViewCell.swift
//  BankHolidays
//
//  Created by Oleksiy Chebotarov on 01/10/2021.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    static let reuseIdentifierCell = "EventTableViewCellID"
    
    var viewModel: CellEventViewModel? {
        didSet {
            setupBindings()
        }
    }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dayOfWeekLabel: UILabel!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var notes: UILabel!

    override func prepareForReuse() {
        titleLabel.text = ""
        dayOfWeekLabel.text = ""
        dayLabel.text = ""
        monthLabel.text = ""
        notes.text = ""
    }
    
    private func setupBindings() {
        guard let viewModel = viewModel else { return }
        titleLabel.text = viewModel.event.title
        dayOfWeekLabel.text = viewModel.dayOfWeek
        dayLabel.text = viewModel.day
        monthLabel.text = viewModel.month
        notes.text = viewModel.notes
        backgroundColor = viewModel.isGone ? .white : .lightGray
    }
}

protocol CellEventViewModelType {
    var event: Event { get }
}

class CellEventViewModel: CellEventViewModelType {
    private(set) var event: Event
    private let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_UK_POSIX")
        
        return formatter
    }()

    init(event: Event) {
        self.event = event
    }
    
    var isGone: Bool {
        event.date >= Date()
    }
    
    var title: String {
        event.title
    }
    
    var dayOfWeek: String {
        formatter.dateFormat = "EEEE"
        return formatter.string(from: event.date).capitalized
    }
    
    var day: String {
        formatter.dateFormat = "dd"
        return formatter.string(from: event.date)
    }
    
    var month: String {
        formatter.dateFormat = "MMM yy"
        return formatter.string(from: event.date)
    }
    
    var notes: String {
        event.notes.rawValue
    }

}
