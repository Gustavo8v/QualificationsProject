//
//  BaseViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
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
    
    func tagTextField(textFields: [SDCTextField], view: RegisterQualificationsViewController) {
        var tag = 0
        textFields.forEach { textField in
            textField.tag = tag
            textField.delegate = view.self
            tag += 1
        }
    }
}
