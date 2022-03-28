//
//  DataPersistence.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import Foundation
import RealmSwift

class DataPersistence {
    
    static let shared:DataPersistence = DataPersistence()
    let realm = try! Realm()
    var qualification: QualificationRealm?
    
    func saveQualification(data: QualificationRealm){
        try! realm.write {
            let newQualification = QualificationRealm()
            newQualification.name = data.name
            newQualification.lastName = data.lastName
            newQualification.grade = data.grade
            newQualification.math = data.math
            newQualification.history = data.history
            newQualification.science = data.science
            newQualification.art = data.art
            newQualification.average = data.average
            realm.add(newQualification)
            qualification = newQualification
        }
    }
}
