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
}
