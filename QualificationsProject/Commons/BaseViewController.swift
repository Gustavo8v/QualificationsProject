//
//  BaseViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    let titleNav = "Mentes Creativas"
    let toolbar = UIToolbar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = titleNav
        addToolBar()
    }
    
    func addToolBar(){
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil, action: nil)
                let doneButton = UIBarButtonItem(title: "Cancelar", style: .done,
                                                 target: self, action: #selector(dismissKeyboard))
                
                toolbar.setItems([flexSpace, doneButton], animated: true)
                toolbar.sizeToFit()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func addViewsCustom(view: UIView, views: [UIView]){
        views.forEach { viewCustom in
            viewCustom.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(viewCustom)
        }
    }
    
    func tagTextField(textFields: [SDCTextField], view: RegisterQualificationsViewController) {
        var tag = 0
        textFields.forEach { textField in
            textField.tag = tag
            textField.delegate = view.self
            tag += 1
        }
    }
}
