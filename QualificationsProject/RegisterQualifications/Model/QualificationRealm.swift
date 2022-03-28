//
//  QualificationRealm.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import Foundation
import RealmSwift

class QualificationRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var grade: String = ""
    @objc dynamic var math: Int = 0
    @objc dynamic var history: Int = 0
    @objc dynamic var science: Int = 0
    @objc dynamic var art: Int = 0
    @objc dynamic var average: String = ""
}
