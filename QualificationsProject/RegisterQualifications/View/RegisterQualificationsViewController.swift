//
//  RegisterQualificationsViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import UIKit

class RegisterQualificationsViewController: BaseViewController {
    
    //Elements UI
    let scrollView = UIScrollView()
    let nameStudent = UITextField()
    let lastNameStudent = UITextField()
    let numberGrade = UITextField()
    let mathematics = UITextField()
    let history = UITextField()
    let science = UITextField()
    let art = UITextField()
    let average = UILabel()
    let saveQualification = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = titleNav
        setNavBar(type: .add, action: #selector(addButtonAction))
    }
    
    override func viewDidLayoutSubviews() {
        let screen = UIScreen.main.bounds
        let name: UITextField = {
            nameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Nombre del estudiante")
            return nameStudent
        }()
        let lastName: UITextField = {
            lastNameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Apellido del estudiante")
            return lastNameStudent
        }()
        let grade: UITextField = {
            numberGrade.configureTextField(keyboard: .numberPad, placeHolder: "Grado")
            return numberGrade
        }()
        let math: UITextField = {
            mathematics.configureTextField(keyboard: .numberPad, placeHolder: "Matemáticas")
           return mathematics
        }()
        let history: UITextField = {
            self.history.configureTextField(keyboard: .numberPad, placeHolder: "Historia")
            return self.history
        }()
        let science: UITextField = {
            self.science.configureTextField(keyboard: .numberPad, placeHolder: "Ciencias")
            return self.science
        }()
        let art: UITextField = {
            self.art.configureTextField(keyboard: .numberPad, placeHolder: "Artes")
            return self.art
        }()
        let averageStudent: UILabel = {
            average.text = "El priomedio se calculará en automático"
            average.textAlignment = .center
            return self.average
        }()
        let button: UIButton = {
            saveQualification.backgroundColor = .systemBlue
            saveQualification.layer.cornerRadius = 25
            saveQualification.setTitleColor(.white, for: .normal)
            saveQualification.setTitle("Guardar Calificación", for: .normal)
            return saveQualification
        }()
        addViewsCustom(view: view, views: [scrollView])
        addViewsCustom(view: scrollView, views: [name, lastName, grade, math, history, science, art, averageStudent, button])
        NSLayoutConstraint.activate([
            //ScrollView
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            //NameStudent
            name.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            name.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            name.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            name.heightAnchor.constraint(equalToConstant: 45),
            //LastNameStudent
            lastName.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            lastName.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lastName.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            lastName.heightAnchor.constraint(equalToConstant: 45),
            //GradeStudent
            grade.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 20),
            grade.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            grade.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            grade.heightAnchor.constraint(equalToConstant: 45),
            //Math
            math.topAnchor.constraint(equalTo: grade.bottomAnchor, constant: 20),
            math.leadingAnchor.constraint(equalTo: grade.leadingAnchor),
            math.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            math.heightAnchor.constraint(equalToConstant: 45),
            //History
            history.topAnchor.constraint(equalTo: grade.bottomAnchor, constant: 20),
            history.trailingAnchor.constraint(equalTo: grade.trailingAnchor),
            history.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            history.heightAnchor.constraint(equalToConstant: 45),
            //Science
            science.topAnchor.constraint(equalTo: math.bottomAnchor, constant: 20),
            science.leadingAnchor.constraint(equalTo: grade.leadingAnchor),
            science.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            science.heightAnchor.constraint(equalToConstant: 45),
            //Art
            art.topAnchor.constraint(equalTo: history.bottomAnchor, constant: 20),
            art.trailingAnchor.constraint(equalTo: grade.trailingAnchor),
            art.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            art.heightAnchor.constraint(equalToConstant: 45),
            //Average
            averageStudent.topAnchor.constraint(equalTo: art.bottomAnchor, constant: 20),
            averageStudent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            averageStudent.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            averageStudent.heightAnchor.constraint(equalToConstant: 45),
            //SaveButton
            button.topAnchor.constraint(equalTo: averageStudent.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc func addButtonAction(){
        print("💅🏾💅🏾💅🏾💅🏾💅🏾💅🏾💅🏾💅🏾")
    }
}
