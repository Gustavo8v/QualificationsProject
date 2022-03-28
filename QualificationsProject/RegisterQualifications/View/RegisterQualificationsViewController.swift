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
    let subjectsPicker = UIPickerView()
    
    let viewModel = RegisterViewModel()
    var isGrade = true
    var textFieldSelect: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = titleNav
        subjectsPicker.delegate = self
        subjectsPicker.dataSource = self
        numberGrade.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(textFieldGrade(textField:))))
    }
    
    override func viewDidLayoutSubviews() {
        let screen = UIScreen.main.bounds
        let name: UITextField = {
            nameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Nombre del estudiante")
            nameStudent.tag = 0
            nameStudent.delegate = self
            return nameStudent
        }()
        let lastName: UITextField = {
            lastNameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Apellido del estudiante")
            lastNameStudent.tag = 1
            return lastNameStudent
        }()
        let grade: UITextField = {
            numberGrade.configureTextField(keyboard: .numberPad, placeHolder: "Grado")
            numberGrade.inputView = subjectsPicker
            numberGrade.tag = 2
            return numberGrade
        }()
        let math: UITextField = {
            mathematics.configureTextField(keyboard: .numberPad, placeHolder: "Matemáticas")
            mathematics.tag = 3
           return mathematics
        }()
        let history: UITextField = {
            self.history.configureTextField(keyboard: .numberPad, placeHolder: "Historia")
            self.history.tag = 4
            return self.history
        }()
        let science: UITextField = {
            self.science.configureTextField(keyboard: .numberPad, placeHolder: "Ciencias")
            self.science.tag = 5
            return self.science
        }()
        let art: UITextField = {
            self.art.configureTextField(keyboard: .numberPad, placeHolder: "Artes")
            self.art.tag = 6
            return self.art
        }()
        let averageStudent: UILabel = {
            average.text = "El priomedio se calculará en automático al llenar todas las materias"
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
    
    @objc func textFieldGrade(textField: UITextField){
        isGrade = true
        textFieldSelect = textField
        textField.inputView = subjectsPicker
    }
    
    @objc func textFieldSubs(textField: UITextField){
        isGrade = false
        textFieldSelect = textField
    }
    
    @objc func showAverage() {
        let qualifications = [mathematics, history, science, art]
        let show = checkTextFields(textFields: qualifications)
        if show {
            let average = checkAverage(subs: qualifications)
            DispatchQueue.main.async {
                self.average.text = average.description
            }
        }
    }
    
    @objc func addNewRegister(){
        let save = checkTextFields(textFields: [nameStudent, lastNameStudent, numberGrade, mathematics, history, science, art])
        if save {
            let average = checkAverage(subs: [mathematics, history, science, art])
            viewModel.saveRegister(name: nameStudent.text ?? "",
                                   lastName: lastNameStudent.text ?? "",
                                   grade: numberGrade.text ?? "",
                                   math: mathematics.text ?? "",
                                   history: history.text ?? "",
                                   science: science.text ?? "",
                                   art: art.text ?? "",
                                   average: String(average)) {
                for case let textField as UITextField in self.view.subviews {
                    textField.text = nil
                }
            }
            self.average.text = "El priomedio se calculará en automático al llenar todas las materias"
        }
    }
}

extension RegisterQualificationsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return viewModel.grades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            numberGrade.text = viewModel.grades[row]
    }
}

extension RegisterQualificationsViewController: UITextFieldDelegate {
    
}
