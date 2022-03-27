//
//  UITextFieldExtension.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import UIKit

extension UITextField {
    
    func configureTextField(keyboard: UIKeyboardType, placeHolder: String){
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.placeholder = placeHolder
        self.keyboardType = keyboard
        self.textAlignment = .center
    }
}
