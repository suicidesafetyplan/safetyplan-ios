//
//  GuideCopingViewController.swift
//  Safety Plan
//
//  Created by Brandon Huettner on 3/8/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import UIKit


class GuideCopingViewController: UIViewController {
    @IBOutlet weak var copingTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CommandLine.arguments.contains("--safetyPlanScreenshots") {
            // We are in testing mode, make arrangements if needed
            UIView.setAnimationsEnabled(false)
        }

        self.copingTextView.scrollRangeToVisible(NSMakeRange(0, 0))
        self.copingTextView.contentSize = self.copingTextView.sizeThatFits(self.copingTextView.frame.size)
        self.copingTextView.textColor = UIColor.label
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.copingTextView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
    }
}

