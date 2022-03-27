//
//  QualificationsTabBar.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import Foundation
import UIKit

class QualificationsTabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        chargeViewTabBar()
    }
    
    func chargeViewTabBar(){
        let registerQualifications = UINavigationController(rootViewController: RegisterQualificationsViewController())
        let qualifications = UINavigationController(rootViewController: QualificationsViewController())
        let registerTabBar = UITabBarItem(title: "Registro", image: UIImage(systemName: "person.crop.circle.badge.plus"), selectedImage: UIImage(systemName: "person.crop.circle.badge.plus"))
        let qualificationsTabBar = UITabBarItem(title: "Calificaciones", image: UIImage(systemName: "list.bullet.rectangle.portrait"), selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait"))
        registerQualifications.tabBarItem = registerTabBar
        qualifications.tabBarItem = qualificationsTabBar
        self.viewControllers = [registerQualifications, qualifications]
    }
}
