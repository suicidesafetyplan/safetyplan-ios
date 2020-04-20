//
//  BaseTableViewCell.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/13/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.commonInit()
    }
    
    func commonInit() {
        // implement in subclass
    }
}
