//
//  RegisterViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import UIKit

class RegisterQualificationsViewController: BaseViewController {
    
    //Elements UI
    let scrollView = UIScrollView()
    let nameStudent = SDCTextField()
    let lastNameStudent = SDCTextField()
    let numberGrade = SDCTextField()
    let mathematics = SDCTextField()
    let history = SDCTextField()
    let science = SDCTextField()
    let art = SDCTextField()
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
    }
    
    override func viewDidLayoutSubviews() {
        let screen = UIScreen.main.bounds
        let name: SDCTextField = {
            nameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Nombre del estudiante")
            nameStudent.valueType = .fullName
            return nameStudent
        }()
        let lastName: SDCTextField = {
            lastNameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Apellido del estudiante")
            nameStudent.valueType = .fullName
            return lastNameStudent
        }()
        let grade: SDCTextField = {
            numberGrade.configureTextField(keyboard: .numberPad, placeHolder: "Grado")
            numberGrade.inputView = subjectsPicker
            return numberGrade
        }()
        let math: SDCTextField = {
            mathematics.configureTextField(keyboard: .numberPad, placeHolder: "Matemáticas")
            mathematics.valueType = .onlyNumbers
            mathematics.maxLength = 2
           return mathematics
        }()
        let history: SDCTextField = {
            self.history.configureTextField(keyboard: .numberPad, placeHolder: "Historia")
            self.history.valueType = .onlyNumbers
            self.history.maxLength = 2
            return self.history
        }()
        let science: SDCTextField = {
            self.science.configureTextField(keyboard: .numberPad, placeHolder: "Ciencias")
            self.science.valueType = .onlyNumbers
            self.science.maxLength = 2
            return self.science
        }()
        let art: SDCTextField = {
            self.art.configureTextField(keyboard: .numberPad, placeHolder: "Artes")
            self.art.valueType = .onlyNumbers
            self.art.maxLength = 2
            return self.art
        }()
        let averageStudent: UILabel = {
            average.text = "El priomedio se calculará en automático al llenar todas las materias"
            average.adjustsFontSizeToFitWidth = true
            average.numberOfLines = 2
            average.textAlignment = .center
            return self.average
        }()
        let button: UIButton = {
            saveQualification.backgroundColor = .lightGray
            saveQualification.isEnabled = false
            saveQualification.layer.cornerRadius = 25
            saveQualification.setTitleColor(.white, for: .normal)
            saveQualification.setTitle("Guardar Calificación", for: .normal)
            saveQualification.addTarget(self, action: #selector(addNewRegister), for: .touchUpInside)
            return saveQualification
        }()
        tagTextField(textFields: [name, lastName, grade, math, history, science, art], view: self)
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
        for case let textField as SDCTextField in scrollView.subviews {
            textField.addTarget(self, action: #selector(changeStateButton(_:)), for: .editingChanged)
        }
    }
    
    @objc func changeStateButton(_ textField: UITextField){
        var enabled = true
        var color = UIColor.systemBlue
        for case let textField as SDCTextField in scrollView.subviews {
            if textField.text == "" {
                enabled = false
                color = .lightGray
            }
        }
        viewModel.checkAverage(av: [mathematics.text,
                                    history.text,
                                    science.text,
                                    art.text]) { av in
            DispatchQueue.main.async {
                self.average.text = av
            }
        }
        self.saveQualification.isEnabled = enabled
        DispatchQueue.main.async {
            self.saveQualification.backgroundColor = color
        }
    }
    
    @objc func showAverage() {
        let qualifications = [mathematics.text, history.text, science.text, art.text]
        let show = viewModel.checkTextFields(textFields: qualifications)
        if show {
            let average = viewModel.checkAverage(subs: qualifications)
            DispatchQueue.main.async {
                self.average.text = average.description
            }
        }
    }
    
    @objc func addNewRegister(){
        let average = viewModel.checkAverage(subs: [mathematics.text, history.text, science.text, art.text])
        viewModel.saveRegister(name: nameStudent.text ?? "",
                               lastName: lastNameStudent.text ?? "",
                               grade: numberGrade.text ?? "",
                               math: mathematics.text ?? "",
                               history: history.text ?? "",
                               science: science.text ?? "",
                               art: art.text ?? "",
                               average: String(average)) {
            for case let textField as SDCTextField in self.scrollView.subviews {
                textField.text = nil
            }
            self.average.text = "El priomedio se calculará en automático al llenar todas las materias"
            self.nameStudent.resignFirstResponder()
            self.viewModel.goToQualification(vc: self)
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
        numberGrade.resignFirstResponder()
    }
}

extension RegisterQualificationsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Verify all the conditions
        if let sdcTextField = textField as? SDCTextField {
            return sdcTextField.verifyFields(shouldChangeCharactersIn: range, replacementString: string)
        } else {
            return false
        }
    }
}
