//
//  RegisterViewModel.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import Foundation

class RegisterViewModel {
    
    let grades = ["1 Semestre", "2 Semestre", "3 Semestre", "4 Semestre"]
    var average = ""
    
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
    
    func goToQualification(vc: RegisterQualificationsViewController) {
        vc.tabBarController?.selectedIndex = 1
    }
    
    func checkAverage(av: [String?], completion: @escaping(String) -> Void){
        var aver = 0.0
        var count = 4
        av.forEach({
            if $0 != "" {
                count -= 1
                aver = aver + (Double($0 ?? "") ?? .zero)
                if count == 0 {
                    let average = Double(aver/4).description
                    completion(average)
                }
            }
        })
    }
    
    func checkTextFields(textFields: [String?]) -> Bool {
        var value = true
        textFields.forEach { textField in
            if textField == "" {
                value = false
            }
        }
        return value
    }
    
    func checkAverage(subs: [String?]) -> Double {
        var qualifications = [Int]()
        subs.forEach { sub in
            guard let qua = Int(sub ?? "0") else { return }
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
}
