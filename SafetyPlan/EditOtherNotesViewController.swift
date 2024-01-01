//
//  EditOtherNotesViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/16/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class EditOtherNotesViewController: BaseViewController, SaveCancellabel {
    
    private var headerLabel = UILabel()
    private var textView = UITextView()
    weak var refreshDelegate: SafetyPlanRefreshDelegate?
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        if CommandLine.arguments.contains("--safetyPlanScreenshots") {
            // We are in testing mode, make arrangements if needed
            UIView.setAnimationsEnabled(false)
        }

        self.title = "Edit Other"
        
        self.setupUI()
        self.setupNavBar()
    }
    
    // MARK: - UI Helper Methods
    func setupUI() {
        for uiView in [self.headerLabel, self.textView] {
            self.view.addSubview(uiView)
            uiView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // Label Constraints
            self.headerLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8),
            self.headerLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            self.headerLabel.bottomAnchor.constraint(equalTo: self.textView.topAnchor, constant: -8),
            self.headerLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8),
            self.headerLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 60),
            // TextView Contraints
            self.textView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8),
            self.textView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8),
            self.textView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        ])
        
        self.headerLabel.text = "Enter any other notes that may be helpful to you during a crisis"
        self.headerLabel.numberOfLines = 0
        
        self.textView.text = UserDefaultsGateway.getOtherNotes()
        self.textView.font = .systemFont(ofSize: 14)
        self.textView.layer.borderWidth = 1
        self.textView.textAlignment = .center
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        self.textView.layer.cornerRadius = 4
        self.textView.layer.masksToBounds = true
    }
    
    // MARK: - Actions
    func onCancel() {
        self.dismiss(animated: true)
    }
    
    func onSave() {
        let otherNotes = self.textView.text ?? ""
        UserDefaultsGateway.save(otherNotes: otherNotes)
        self.refreshDelegate?.refreshData()
        self.dismiss(animated: true)
    }
}
