//
//  DoubleTextFieldTableCell.swift
//  Safety Plan
//
//  Created by Shayne Torres on 3/16/20.
//  Copyright © 2020 MoodTools. All rights reserved.
//

import Foundation
import UIKit

class DoubleTextFieldTableCell: BaseTableViewCell, UITextFieldDelegate {
    
    enum TextFieldType {
        case first
        case second
    }
    
    var firstTextField = UITextField()
    var secondTextField = UITextField()
    
    var textFieldValueDidChangeCompletion: ((String, String) -> ())?
    var textFieldDidClearCompletion: ((TextFieldType) -> ())?
    
    override func commonInit() {
        for textField in [self.firstTextField, self.secondTextField] {
            self.contentView.addSubview(textField)
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.clearButtonMode = .always
            textField.delegate = self
        }
        NSLayoutConstraint.activate([
            // first text field Constraints
            firstTextField.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            firstTextField.bottomAnchor.constraint(equalTo: secondTextField.topAnchor, constant: -16),
            firstTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            firstTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            // second text field Constraints
            secondTextField.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            secondTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            secondTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
        ])
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var firstComboString = firstTextField.text ?? ""
        var secondComboString = secondTextField.text ?? ""
        if textField == firstTextField {
            firstComboString = firstComboString.appending(string)
        } else {
            secondComboString = secondComboString.appending(string)
        }
        self.textFieldValueDidChangeCompletion?(firstComboString, secondComboString)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textFieldValueDidChangeCompletion?(firstTextField.text ?? "", secondTextField.text ?? "")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        let type: TextFieldType = textField == self.firstTextField ? .first : .second
        self.textFieldDidClearCompletion?(type)
        return true
    }
}
