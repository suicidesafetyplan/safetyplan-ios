//
//  CrisisViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/7/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class CrisisViewController: UIViewController {
    
    // Enum to represent the different rows that can be displayed in the CrisisTableViewController table view
    enum CrisisRowType {
        case callEmergencyNumber
        case callHelpline
        case textCrisisTextLine
        case callContact(name: String, number: String)
        case findUrgentCare
        case findEmergencyDepartment
        
        
        // The title to be displayed for the specified row
        var title: String {
            switch self {
            case .callEmergencyNumber:
                return "Call Emergency Number"
            case .callHelpline:
                return "Call Helpline"
            case .textCrisisTextLine:
                return "Text Crisis Text Line"
            case .callContact(let name, _):
                return "Call \(name)"
            case .findUrgentCare:
                return "Find Urgent Care"
            case .findEmergencyDepartment:
                return "Find Emergency Departments"
            }
        }
        
        // The image to be displayed for the specified row
        var rowImage: UIImage? {
            switch self {
            case .callHelpline, .callEmergencyNumber, .callContact:
                return UIImage(named: "ic_action_call")
            case .textCrisisTextLine:
                return UIImage(named: "mail")
            case .findUrgentCare, .findEmergencyDepartment:
                return UIImage(named: "ic_action_locate")
            }
        }
    }
    
    // Enum to represent the different actions for alerts in the CrisisViewController
    enum AlertActionType {
        case call
        case text
        
        var title: String {
            switch self {
            case .call:
                return "Call"
            case .text:
                return "Text"
            }
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    // Represents the data to be displayed in the rows of the CrisisViewController tableView
    private var data: [CrisisRowType] = []
    private let tableViewCellIdentifier = "CrisisRowCell"
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bar color code
        self.navigationController?.navigationBar.isTranslucent = false
        
        // Set title and title color
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        //set back button arrow color
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "Crisis"
        
        // This will remove extra separators from tableview**********************
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorInset = .zero
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update the datasource to reflect the most up to date data
        self.organizeDataSource()
        // reload tableview to show updated data
        self.tableView.reloadData()
    }
    
    // MARK: - Data methods
    private func organizeDataSource() {
        
        // Setup data with rows to be shown first
        data = [
            .callEmergencyNumber,
            .callHelpline,
            .textCrisisTextLine
        ]
        
        // TODO: [ST] come up with a better way to store and retrieve contacts from User defaults.
        // Doing it this way is not super safe and not flexible. We should allow the user to have more than just 9 contacts
        let defaults = UserDefaults.standard
        let contacts: [PersonalContact] = (1...9).compactMap {
            guard
                let name = defaults.string(forKey: "name\($0)"),
                let number = defaults.string(forKey: "number\($0)")
            else { return nil }
            
            return PersonalContact(name: name, number: number)
        }
            // filter out any contacts that dont have a name or number
        .filter { !$0.name.isEmpty && !$0.contactNumber.isEmpty }
        
        // add a "Call CONTACT NAME" row for each one stored in the UserDefaults
        contacts.forEach { data.append(.callContact(name: $0.name, number: $0.contactNumber)) }
        
        // Add any rows that should appear after the "Call CONTACT NAME" rows
        data += [
            .findUrgentCare,
            .findEmergencyDepartment
        ]
    }
    
    // MARK: - Alert Presentation Methods
    
    /// Shows an Alert with the given information. User when a user taps on a row for an action to call or text
    /// - Parameter type: The type of action to be taken, either call or text
    /// - Parameter title: The title for the alert
    /// - Parameter message: The message for the alert
    /// - Parameter phoneNumber: The contact number to be used in the action
    private func showAlert(type: AlertActionType, title: String, message: String, phoneNumber: String) {
        // instantiate a new alert controller
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // create the confirm action
        let confirmAction = UIAlertAction(title: "Yes", style: .default, handler: { _ in
            alertController.dismiss(animated: true, completion: {
                var contactUrl: URL?
                // depending on the action type (call vs text) we need to create the URL in different ways
                switch type {
                case .call:
                    contactUrl = URL(string: "tel://\(phoneNumber)")
                case .text:
                    let urlStr = "sms:+\(phoneNumber)"
                    let contactUrlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
                    contactUrl = URL(string: contactUrlStr)
                }
                guard let contactNumberUrl = contactUrl else { return }
                
                UIApplication.shared.openURL(contactNumberUrl)
            })
        })
        // create the cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in alertController.dismiss(animated: true) })
        
        // add the alert actions to the alert controller
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    /// Attemps to open the google maps app with the given search query. Defaults to the native web brower if google maps is not available
    /// - Parameter searchQuery: The search query to be user when opening the maps
    private func openMaps(searchQuery: String) {
        // Attempt to open search query in Google Maps app
        if let mapBaseUrl = URL(string: "comgooglemaps://"), UIApplication.shared.canOpenURL(mapBaseUrl), let url = URL(string: "comgooglemaps://?q=\(searchQuery)") {
            UIApplication.shared.openURL(url)
        } else if let url = URL(string: "http://www.google.com/maps/search/\(searchQuery)") {
            // Default to the native web browser
            UIApplication.shared.openURL(url)
        }
    }
}

// MARK: - UITableViewDataSource/Delegate Methods
extension CrisisViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CrisisRowCell") else { fatalError("UITableViewCell not registered") }
        let rowType = data[indexPath.row]
        
        cell.textLabel?.text = rowType.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22, weight: .light)
        cell.imageView?.image = rowType.rowImage
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowType = self.data[indexPath.row]
        switch rowType {
        case .callEmergencyNumber:
            let contact = ImportantContactInformation.localEmergencyLine
            self.showAlert(type: .call, title: "Call", message: "Call 911?", phoneNumber: contact.contactNumber)
        case .callHelpline:
            let contact = ImportantContactInformation.nationalSuicidePreventionLifeline
            self.showAlert(type: .call, title: "Call", message: "Call \(contact.title)?", phoneNumber: contact.contactNumber)
        case .textCrisisTextLine:
            let contact = ImportantContactInformation.crisisTextLine
            self.showAlert(type: .text, title: "Text \(contact.title)", message: "Text \(contact.contactNumber)", phoneNumber: contact.contactNumber)
        case .callContact(let name, let number):
            self.showAlert(type: .call, title: "Call", message: "Call \(name)?", phoneNumber: number)
        case .findUrgentCare:
            self.openMaps(searchQuery: "Urgent+Care")
        case .findEmergencyDepartment:
            self.openMaps(searchQuery: "Emergency+Department")
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
