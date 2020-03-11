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
        
        if #available(iOS 13.0, *) {
            recoveringTextView.textColor = UIColor.label
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

