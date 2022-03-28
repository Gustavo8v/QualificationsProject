//
//  QualificartionsModelView.swift
//  QualificationsProject
//
//  Created by Gustavo on 28/03/22.
//

import Foundation
import RealmSwift

class QualificationsModelView {
    
    var students = try! Realm().objects(QualificationRealm.self)
    
    func allStudents() -> [QualificationRealm] {
        var all = [QualificationRealm]()
        students.forEach { qua in
            all.append(qua)
        }
        return all
    }
    
    func fistGrade() -> [QualificationRealm] {
        var first = [QualificationRealm]()
        students.forEach { qua in
            if qua.grade == "1 Semestre" {
                first.append(qua)
            }
        }
        return first
    }
    
    func secondGrade() -> [QualificationRealm] {
        var second = [QualificationRealm]()
        students.forEach { qua in
            if qua.grade == "2 Semestre" {
                second.append(qua)
            }
        }
        return second
    }
    
    func thredGrade() -> [QualificationRealm] {
        var thred = [QualificationRealm]()
        students.forEach { qua in
            if qua.grade == "3 Semestre" {
                thred.append(qua)
            }
        }
        return thred
    }
    
    func fourtGrade() -> [QualificationRealm] {
        var fourt = [QualificationRealm]()
        students.forEach { qua in
            if qua.grade == "4 Semestre" {
                fourt.append(qua)
            }
        }
        return fourt
    }
    
    func filterWithName(name: String) -> [QualificationRealm] {
        var filter = [QualificationRealm]()
        if name == "" {
            return allStudents()
        } else {
            students.forEach { nameFilter in
                if nameFilter.name.contains(name) {
                    filter.append(nameFilter)
                }
            }
            return filter
        }
        
    }
}
