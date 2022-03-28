//
//  RegisterViewModel.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import Foundation

class RegisterViewModel {
    
    let grades = ["1 Semestre", "2 Semestre", "3 Semestre", "4 Semestre"]
    
    func saveRegister(name: String,
                      lastName: String,
                      grade: String,
                      math: String,
                      history: String,
                      science: String,
                      art: String,
                      average: String,
                      complete: @escaping() -> Void){
        
        guard let safeMath = Int(math),
              let safeHistory = Int(history),
              let safeScience = Int(science),
              let safeArt = Int(art) else {
                  return
              }
        let qualification = QualificationRealm()
        qualification.name = name
        qualification.lastName = lastName
        qualification.grade = grade
        qualification.math = safeMath
        qualification.history = safeHistory
        qualification.science = safeScience
        qualification.art = safeArt
        qualification.average = average
        DataPersistence.shared.saveQualification(data: qualification)
        complete()
    }
}
