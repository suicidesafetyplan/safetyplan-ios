//
//  SafetyPlanViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/11/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class SafetyPlanViewController: BaseViewController {
    
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
    }
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var data: [RowType] = []
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Plan"
        self.setup(tableView: self.tableView)
        self.organizeData()
        self.tableView.reloadData()
    }
    
    // MARK: - Helper Methods
    private func organizeData() {
        self.data = [
            .warningSings,
            .copingStrategies,
            .reasonsToLive,
            .contacts,
            .placesforDistraction,
            .other
        ]
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
        let rowType = self.data[indexPath.row]
        cell.textLabel?.text = rowType.title
        cell.textLabel?.font = .systemFont(ofSize: 20, weight: .light)
        cell.detailTextLabel?.text = rowType.subtitle
        cell.detailTextLabel?.font = .systemFont(ofSize: 17)
        cell.detailTextLabel?.numberOfLines = 0
        cell.imageView?.image = rowType.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowType = self.data[indexPath.row]
        
        switch rowType {
        case .warningSings:
            let sb = UIStoryboard(name: "safetyplanlayout", bundle: nil)
            let warningNavVC = sb.instantiateViewController(withIdentifier: "WarningSignsNavVC")
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
    }
}
