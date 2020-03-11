//
//  GuideSuicidePreventionViewController.swift
//  Safety Plan
//
//  Created by Brandon Huettner on 3/11/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import UIKit


class GuideSuicidePreventionViewController: UIViewController {
    @IBOutlet weak var suicidePreventionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            suicidePreventionTextView.textColor = UIColor.label
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
