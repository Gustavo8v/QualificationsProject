//
//  UITextFieldExtension.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import UIKit

extension UITextField {
    
    func addDoneCancelToolbar() {
            let onCancel = (target: self, action: #selector(cancelButtonTapped))
            let toolbar: UIToolbar = UIToolbar()
            toolbar.barStyle = .default
            toolbar.items = [
                UIBarButtonItem(title: "Cancelar", style: .plain, target: onCancel.target, action: onCancel.action),
                UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            ]
            toolbar.sizeToFit()
            self.inputAccessoryView = toolbar
        }

        // Default actions:
        @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
