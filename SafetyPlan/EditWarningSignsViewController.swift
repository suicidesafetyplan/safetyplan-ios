//
//  EditWarningSignsViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/13/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class EditWarningSignsViewController: BaseViewController {
    
    enum RowType {
        case headerMessage(message: String)
        case warningSignTextField(name: String)
        case button(title: String)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var rows: [RowType] = []
    private var warningSigns: [SafetyPlanItem] = []
    private var shouldAddAnotherWarningSign: Bool {
        // only allow adding another warning sign if there are less than 9 visible
        self.warningSigns.count < 9
    }
    override var registeredTableViewCells: [UITableViewCell.Type] {
        [
            TextFieldTableViewCell.self,
            ButtonCell.self
        ]
    }
    weak var refreshDelegate: SafetyPlanRefreshDelegate?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Edit Warning Signs"
        self.setup(tableView: self.tableView)
        self.setupNavBar()
        // initialize the original set of warning signs
        self.warningSigns = UserDefaultsGateway.getAllSafetyPlanItems(ofType: .warningSign)
        self.organizeData()
        self.tableView.reloadData()
    }
    
    // MARK: - Helper Methods
    private func organizeData() {
        // clear all rows to refresh data
        self.rows.removeAll()
        
        self.rows.append(.headerMessage(message: "What sort of thoughts, images, moods, situations, of behaviors indicate to you that crisis may be developing?"))
        // Grab all saved warning signs from UserDefaults
        
        let emptyWarningSignCount = 3 - warningSigns.count
        if emptyWarningSignCount > 0 {
            for _ in 1...emptyWarningSignCount {
                self.warningSigns.append(SafetyPlanItem(name: "", type: .warningSign))
            }
        }
        
        // Add all saved warning signs to be displayed
        for warningSign in self.warningSigns {
            self.rows.append(.warningSignTextField(name: warningSign.name))
        }
        
        // Add the "Add Another" button
        if self.shouldAddAnotherWarningSign {
            self.rows.append(.button(title: "+ Add Another"))
        }
    }
    
    // MARK: - UI Methods
    /// Sets up the view controllers navigation bar view including bar button items
    private func setupNavBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onSave))
    }
    
    // MARK: - Actions
    @objc private func onCancel() {
        self.dismiss(animated: true)
    }
    
    @objc private func onSave() {
        let nonEmptyWarningSigns = self.warningSigns.filter { !$0.name.trimmingCharacters(in: .whitespaces).isEmpty }
        UserDefaultsGateway.save(safteyPlanItems: nonEmptyWarningSigns, for: .warningSign)
        self.refreshDelegate?.refreshData()
        self.dismiss(animated: true)
    }
    
    private func onAddAnother() {
        guard self.shouldAddAnotherWarningSign else { return }
        self.warningSigns.append(SafetyPlanItem(name: "", type: .warningSign))
        self.organizeData()
        self.tableView.reloadData()
    }
}

// MARK: - UITableView Methods
extension EditWarningSignsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = self.rows[indexPath.row]
        switch rowType {
        case .headerMessage(let message):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: self.defaultTableViewCellIdentifier) else { return UITableViewCell() }
            cell.textLabel?.text = message
            cell.textLabel?.numberOfLines = 0
            return cell
        case .warningSignTextField(let name):
            let textFieldCell = tableView.deque(TextFieldTableViewCell.self)
            textFieldCell.textField.text = name
            textFieldCell.textField.placeholder = "Tap to add Warning Sign"
            textFieldCell.textFieldValueDidChangeCompletion = { newString in
                // since the header message is the first cell, offest the index path by 1 to grab the correct warning sign
                self.warningSigns[indexPath.row - 1].name = newString
            }
            textFieldCell.textFieldDidClearCompletion = {
                self.warningSigns[indexPath.row - 1].name.removeAll()
            }
            return textFieldCell
        case .button(let title):
            let buttonCell = tableView.deque(ButtonCell.self)
            buttonCell.buttonTitle = title
            buttonCell.onTapCompletion = {
                self.onAddAnother()
            }
            return buttonCell
        }
    }
}
