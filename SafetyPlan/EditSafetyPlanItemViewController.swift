//
//  EditSafetyPlanItemViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/16/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

@objc protocol SaveCancellabel {
    @objc func onCancel()
    @objc func onSave()
}

extension SaveCancellabel where Self: UIViewController {
    // MARK: - UI Methods
    /// Sets up the view controllers navigation bar view including bar button items
    func setupNavBar() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancel))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(onSave))
    }
}

class EditSafetyPlanItemViewController: BaseViewController, SaveCancellabel {
    
    enum RowType {
        case headerMessage(message: String)
        case safetyPlanItemTextField(name: String)
        case personalContactTextFields(name: String, number: String)
        case button(title: String)
    }
    
    @objc class func newFromStoryboard(type: SafetyPlanItem.ItemType, refreshDelegate: SafetyPlanRefreshDelegate) -> EditSafetyPlanItemViewController {
        let sb = UIStoryboard(name: "Plan", bundle: nil)
        let editSafetyVC = sb.instantiateViewController(withIdentifier: "EditSafetyPlanItemNav") as! EditSafetyPlanItemViewController
        editSafetyVC.refreshDelegate = refreshDelegate
        editSafetyVC.safetyPlanItemType = type
        return editSafetyVC
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var rows: [RowType] = []
    private var safetyPlanItems: [SafetyPlanItem] = []
    private var shouldAddAnotherSafetyPlanItem: Bool {
        // only allow adding another safetyPlanItem if there are less than 9 visible
        self.safetyPlanItems.count < 9
    }
    override var registeredTableViewCells: [UITableViewCell.Type] {
        [
            TextFieldTableViewCell.self,
            DoubleTextFieldTableCell.self,
            ButtonCell.self
        ]
    }
    weak var refreshDelegate: SafetyPlanRefreshDelegate?
    var safetyPlanItemType: SafetyPlanItem.ItemType = .warningSign
    private let safetyPlanItemGateway = SafetyPlanItemGateway()
    private let personalContactGateway = PersonalContactGateway()
    
    private var typeName: String {
        switch self.safetyPlanItemType {
        case .warningSign:
            return "Warning Signs"
        case .copingStrategy:
            return "Coping Strategies"
        case .reasonToLive:
            return "Reasons to Live"
        case .placeForDistraction:
            return "Places for Distraction"
        case .personalContact:
            return "Contacts"
        }
    }
    
    private var headerMessage: String {
        switch self.safetyPlanItemType {
        case .warningSign:
            return "What sort of thoughts, images, moods, situations, of behaviors indicate to you that crisis may be developing?"
        case .copingStrategy:
            return "What are some things that you can do on your own to help you not act on thoughts/urges to harm yourself?"
        case .reasonToLive:
            return "What are some things that are important to you and worth living for?"
        case .placeForDistraction:
            return "What are some healthy social settings that can help you take your mind off of things?"
        case .personalContact:
            return "Enter the names and phone numbers of friends, family, professionals, or other resources you can contact during a crisis. These people will appear in the Crisis section so you can easily call them during a crisis"
        }
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Edit \(self.typeName)"
        self.setup(tableView: self.tableView)
        self.setupNavBar()
        // initialize the original set of safetyPlanItems
        self.safetyPlanItems = self.fetchSafetyPlanItems(for: self.safetyPlanItemType)
        self.organizeData()
        self.tableView.reloadData()
    }
    
    
    
    // MARK: - Data Helper Methods
    
    /// Returns the appropriate SafetyPlanItems for the given type
    /// - Parameter type: The type of safety plan item to return
    private func fetchSafetyPlanItems(for type: SafetyPlanItem.ItemType) -> [SafetyPlanItem] {
        if type == .personalContact {
            return personalContactGateway.getAll()
        } else {
            return safetyPlanItemGateway.getAll(forType: self.safetyPlanItemType)
        }
    }
    
    private func organizeData() {
        // clear all rows to refresh data
        self.rows.removeAll()
        
        self.rows.append(.headerMessage(message: self.headerMessage))
        
        // Grab all saved safetyPlanItems from UserDefaults
        let emptySafetyPlanItems = 3 - safetyPlanItems.count
        if emptySafetyPlanItems > 0 {
            for _ in 1...emptySafetyPlanItems {
                // update data depending on if we are showing personal contacts or not
                if self.safetyPlanItemType == .personalContact {
                    self.safetyPlanItems.append(PersonalContact(name: "", number: ""))
                } else {
                    self.safetyPlanItems.append(SafetyPlanItem(name: "", type: self.safetyPlanItemType))
                }
            }
        }
        
        // Add all saved safetyPlanItem to be displayed
        for item in self.safetyPlanItems {
            if self.safetyPlanItemType == .personalContact, let contact = item as? PersonalContact {
                self.rows.append(.personalContactTextFields(name: contact.name, number: contact.contactNumber))
            } else {
                self.rows.append(.safetyPlanItemTextField(name: item.name))
            }
        }
        
        // Add the "Add Another" button
        if self.shouldAddAnotherSafetyPlanItem {
            self.rows.append(.button(title: "+ Add Another"))
        }
    }
    
    // MARK: - Actions
    @objc internal func onCancel() {
        self.dismiss(animated: true)
    }
    
    @objc internal func onSave() {
        if self.safetyPlanItemType == .personalContact, let contacts = self.safetyPlanItems as? [PersonalContact] {
            let nonEmptyPersonalContacts = contacts.filter { !$0.isEmpty }
            self.personalContactGateway.replaceAll(with: nonEmptyPersonalContacts)
        } else {
            let nonEmptySafetyPlanItems = self.safetyPlanItems.filter { !$0.name.trimmingCharacters(in: .whitespaces).isEmpty }
            self.safetyPlanItemGateway.replaceAll(with: nonEmptySafetyPlanItems)
        }
        self.refreshDelegate?.refreshData()
        self.dismiss(animated: true)
    }
    
    private func onAddAnother() {
        guard self.shouldAddAnotherSafetyPlanItem else { return }
        if self.safetyPlanItemType == .personalContact {
            self.safetyPlanItems.append(PersonalContact(name: "", number: ""))
        } else {
            self.safetyPlanItems.append(SafetyPlanItem(name: "", type: self.safetyPlanItemType))
        }
        self.organizeData()
        self.tableView.reloadData()
    }
}

// MARK: - UITableView Methods
extension EditSafetyPlanItemViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        let rowType = self.rows[indexPath.row]
        switch rowType {
        case .headerMessage(let message):
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: self.defaultTableViewCellIdentifier) else { return UITableViewCell() }
            headerCell.textLabel?.text = message
            headerCell.textLabel?.numberOfLines = 0
            cell = headerCell
        case .safetyPlanItemTextField(let name):
            let textFieldCell = tableView.deque(TextFieldTableViewCell.self)
            textFieldCell.textField.text = name
            textFieldCell.textField.placeholder = "Tap to add \(self.typeName)"
            textFieldCell.textFieldValueDidChangeCompletion = { newString in
                // since the header message is the first cell, offest the index path by 1 to grab the correct safety plan item
                self.safetyPlanItems[indexPath.row - 1].name = newString
            }
            textFieldCell.textFieldDidClearCompletion = {
                self.safetyPlanItems[indexPath.row - 1].name.removeAll()
            }
            cell = textFieldCell
        case .personalContactTextFields(let name, let number):
            // since the header message is the first cell, offest the index path by 1 to grab the correct safety plan item
            let doubleTextFieldCell = tableView.deque(DoubleTextFieldTableCell.self)
            doubleTextFieldCell.firstTextField.text = name
            doubleTextFieldCell.secondTextField.text = number
            doubleTextFieldCell.firstTextField.placeholder = "Tap to add name"
            doubleTextFieldCell.secondTextField.placeholder = "Tap to add number"
            doubleTextFieldCell.secondTextField.keyboardType = .phonePad
            doubleTextFieldCell.textFieldValueDidChangeCompletion = { firstString, secondString in
                if let contact = self.safetyPlanItems[indexPath.row - 1] as? PersonalContact {
                    contact.name = firstString
                    contact.contactNumber = secondString
                }
            }
            doubleTextFieldCell.textFieldDidClearCompletion = { textFieldType in
                if let contact = self.safetyPlanItems[indexPath.row - 1] as? PersonalContact {
                    if textFieldType == .first {
                        contact.name.removeAll()
                    } else {
                        contact.contactNumber.removeAll()
                    }
                }
            }
            cell = doubleTextFieldCell
        case .button(let title):
            let buttonCell = tableView.deque(ButtonCell.self)
            buttonCell.buttonTitle = title
            buttonCell.onTapCompletion = {
                self.onAddAnother()
            }
            cell = buttonCell
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

