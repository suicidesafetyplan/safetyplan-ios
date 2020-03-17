//
//  TextFieldTableViewCell.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/13/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class TextFieldTableViewCell: BaseTableViewCell, UITextFieldDelegate {
    
    var textField = UITextField()
    var textFieldValueDidChangeCompletion: ((String) -> ())?
    var textFieldDidClearCompletion: (() -> ())?
    
    override func commonInit() {
        self.addSubview(self.textField)
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.clearButtonMode = .always
        self.textField.delegate = self
        NSLayoutConstraint.activate([
            self.textField.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            self.textField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString = textField.text ?? ""
        let comboString = currentString.appending(string)
        self.textFieldValueDidChangeCompletion?(comboString)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textFieldValueDidChangeCompletion?(self.textField.text ?? "")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        self.textFieldDidClearCompletion?()
        return true
    }
}
