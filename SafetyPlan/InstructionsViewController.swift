//
//  InstructionsViewController.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/17/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class InstructionsViewController: BaseViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if CommandLine.arguments.contains("--safetyPlanScreenshots") {
            // We are in testing mode, make arrangements if needed
            UIView.setAnimationsEnabled(false)
        }
    }
}
