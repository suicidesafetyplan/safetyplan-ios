//
//  SafetyPlanViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/11/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

protocol SafetyPlanRefreshDelegate: class {
    func refreshData()
}

class SafetyPlanViewController: BaseViewController {
    
    struct RowData {
        var rowType: RowType
        var data: [SafetyPlanItem]
    }
    
    enum RowType {
        case warningSings
        case copingStrategies
        case reasonsToLive
        case contacts
        case placesforDistraction
        case other
        
        var title: String {
            switch self {
            case .warningSings:
                return "Warning Signs"
            case .copingStrategies:
                return "Coping Strategies"
            case .reasonsToLive:
                return "Reasons to Live"
            case .contacts:
                return "Contacts"
            case .placesforDistraction:
                return "Places for Distraction"
            case .other:
                return "Other"
            }
        }
        
        var image: UIImage? {
            switch self {
            case .warningSings:
                return UIImage(named: "planwarningsigns")
            case .copingStrategies:
                return UIImage(named: "plancoping")
            case .reasonsToLive:
                return UIImage(named: "plansun")
            case .contacts:
                return UIImage(named: "planfamily")
            case .placesforDistraction:
                return UIImage(named: "planplacesfordistraction")
            case .other:
                return UIImage(named: "planglasses")
            }
        }
        
        var subtitle: String {
            switch self {
            case .warningSings:
                return "Tap the row to add warning signs that a crisis may occur"
            case .copingStrategies:
                return "Tap the row to add coping strategies"
            case .reasonsToLive:
                return "Tap the row to to add thinsg that are worth living for"
            case .contacts:
                return "IMPLEMENT"
            case .placesforDistraction:
                return "Tap the row to add places that can distract you"
            case .other:
                return "Tap the row to add any additional notes that could be helpful"
            }
        }
        
        var relatedSafetyItemType: SafetyPlanItem.ItemType? {
            switch self {
            case .warningSings:
                return .warningSign
            case .copingStrategies:
                return .copingStrategy
            case .reasonsToLive:
                return .reasonToLive
            case .placesforDistraction:
                return .placeForDistraction
            case .contacts, .other:
                return nil
            }
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var data: [RowData] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Plan"
        self.setup(tableView: self.tableView)
        self.refreshData()
    }
    
    // MARK: - Helper Methods
    private func organizeData() {
        // The data for this view is a static list of Safety Plan options
        // These will be used to determine what info to show and actions to take in the table view
        let displayedRowTypes: [RowType] = [
            .warningSings,
            .copingStrategies,
            .reasonsToLive,
            .contacts,
            .placesforDistraction,
            .other
        ]
        
        // refresh the data from the list of static row types
        self.data = displayedRowTypes
            .compactMap {
                guard let safetyItemType = $0.relatedSafetyItemType else {
                    // if the rowType does not have a relatedSafetyItemType, return a RowData with no Data
                    return RowData(rowType: $0, data: [])
                }
                // if the rowType does have a relatedSafetyItemType, return a RowData with data saved in UserDefaults
                return RowData(rowType: $0, data: UserDefaultsGateway.getAllSafetyPlanItems(ofType: safetyItemType))
            }
    }
}

// MARK: - UITableView Methods
extension SafetyPlanViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.defaultTableViewCellIdentifier)
        let rowData = self.data[indexPath.row]
        cell.textLabel?.text = rowData.rowType.title
        cell.textLabel?.font = .systemFont(ofSize: 20, weight: .light)
        
        var detailText = rowData.rowType.subtitle
        
        // if the current displayed option is one that contains saved safety plan items, grab the saved items, and display them as part of the detail text label
        for (index, item) in rowData.data.enumerated() {
            if index == 0 {
                // if this is the first item, add an extra line break
                detailText.append("\r")
            }
            // for every safety plan item add a line break and a dot to list the saved item
            detailText.append("\r • \(item.name)")
        }
        cell.detailTextLabel?.text = detailText
        cell.detailTextLabel?.font = .systemFont(ofSize: 17)
        cell.detailTextLabel?.numberOfLines = 0
        cell.imageView?.image = rowData.rowType.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowData = self.data[indexPath.row]
        
        switch rowData.rowType {
        case .warningSings:
            let sb = UIStoryboard(name: "Plan", bundle: nil)
            let warningNavVC = sb.instantiateViewController(withIdentifier: "WarningSignsNavVC")
            guard let warningSignsVC = (warningNavVC as? UINavigationController)?.topViewController as? EditWarningSignsViewController else { return }
            warningSignsVC.refreshDelegate = self
            self.present(warningNavVC, animated: true)
        case .copingStrategies:
            break
        case .reasonsToLive:
            break
        case .contacts:
            break
        case .placesforDistraction:
            break
        case .other:
            break
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SafetyPlanViewController: SafetyPlanRefreshDelegate {
    
    /// Delegate method called when we want to refresh and reload the data for this view
    func refreshData() {
        // refresh the data
        self.organizeData()
        // refresh the table view
        self.tableView.reloadData()
    }
}
