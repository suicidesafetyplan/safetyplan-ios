//
//  UITableViewExtensions.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/13/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    /// Registers a collection of UITableViewCell type so they can be dequed later
    /// - Parameter cells: The list of cell types to be registered
    func register(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            self.register(cell)
        }
    }
    
    /// Registers the given cell type so it can be dequed later
    /// - Parameter cell: The cell type to be registered
    func register(_ cell: UITableViewCell.Type) {
        self.register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    /// Deques a UITableViewCell Subclass of Type T from the table view
    /// - Parameter cell: The UITableViewCell subclass type to deque
    func deque<T>(_ cell: T.Type) -> T {
        guard
            let dequedCell = self.dequeueReusableCell(withIdentifier: String(describing: cell)) as? T
        else { fatalError("UITableViewCell Deque Error: That cell was not properly registered with the tableview") }
        
        return dequedCell
    }
}
