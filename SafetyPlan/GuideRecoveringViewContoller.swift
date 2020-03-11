//
//  GuideRecoveringViewContoller.swift
//  Safety Plan
//
//  Created by Brandon Huettner on 3/8/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import UIKit


class GuideRecoveringViewContoller: UIViewController {
    @IBOutlet weak var recoveringTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recoveringTextView .scrollRangeToVisible(NSMakeRange(0, 0))
        self.recoveringTextView.contentSize = self.recoveringTextView.sizeThatFits(self.recoveringTextView.frame.size)
        
        if #available(iOS 13.0, *) {
            self.recoveringTextView.textColor = UIColor.label
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        self.recoveringTextView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

