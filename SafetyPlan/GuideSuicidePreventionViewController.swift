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
        
        self.suicidePreventionTextView .scrollRangeToVisible(NSMakeRange(0, 0))
        self.suicidePreventionTextView.contentSize = self.suicidePreventionTextView.sizeThatFits(self.suicidePreventionTextView.frame.size)
        
        if #available(iOS 13.0, *) {
            self.suicidePreventionTextView.textColor = UIColor.label
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        self.suicidePreventionTextView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
