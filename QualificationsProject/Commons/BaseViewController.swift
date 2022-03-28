//
//  BaseViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    let titleNav = "Mentes Creativas"
    
    enum TypeNavBar {
        case search
        case add
    }
    
    func setNavBar(type: TypeNavBar, action: Selector?){
        switch type {
        case .search:
            let searchBar = UISearchBar()
            navigationItem.titleView = searchBar
        case .add:
            let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                            style: .plain,
                                            target: self,
                                            action: action)
            navigationItem.rightBarButtonItem = addButton
        }
    }
    
    func addViewsCustom(view: UIView, views: [UIView]){
        views.forEach { viewCustom in
            viewCustom.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(viewCustom)
        }
    }
    
    func checkTextFields(textFields: [UITextField]) -> Bool {
        var value = true
        textFields.forEach { textField in
            if textField.text == "" || textField.text == nil {
                value = false
            }
        }
        return value
    }
    
    func returnQualifications(textFields: [UITextField]) -> [Int]{
        var qualifications = [Int]()
        textFields.forEach { textField in
            guard let qua = Int(textField.text ?? "0") else { return }
            qualifications.append(qua)
        }
        return qualifications
    }
    
    func checkAverage(subs: [UITextField]) -> Double {
        var qualifications = [Int]()
        subs.forEach { sub in
            guard let qua = Int(sub.text ?? "0") else { return }
            qualifications.append(qua)
        }
        var sum = 0
        var aver: Double = 0.0
        qualifications.forEach { sub in
            sum = sum + sub
        }
        aver = Double(sum) / 4
        return aver
    }
    
    func tagTextField(textFields: [UITextField], view: RegisterQualificationsViewController) {
        var tag = 0
        textFields.forEach { textField in
            textField.tag = tag
            textField.delegate = view.self
            tag += 1
        }
    }
}
