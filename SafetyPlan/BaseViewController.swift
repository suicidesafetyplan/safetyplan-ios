//
//  BaseViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/11/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    let defaultTableViewCellIdentifier = "defaultTableViewCellIdentifier"
    var registeredTableViewCells: [UITableViewCell.Type] { [] }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if CommandLine.arguments.contains("--safetyPlanScreenshots") {
            // We are in testing mode, make arrangements if needed
            UIView.setAnimationsEnabled(false)
        }

        // Bar color code
        self.navigationController?.navigationBar.isTranslucent = false
        
        // Set title and title color
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        //set back button arrow color
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    // MARK: - Helper Methods
    func setup(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .zero
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.defaultTableViewCellIdentifier)
        
        for cellType in self.registeredTableViewCells {
            tableView.register(cellType, forCellReuseIdentifier: String(describing: cellType))
        }
    }
}

// MARK: - UITableView  Methods
extension BaseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Implement in subclass
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Implement in subclass
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Implement in subclass
        return UITableViewCell()
    }
}
