//
//  RegisterViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 27/03/22.
//

import UIKit

class RegisterQualificationsViewController: BaseViewController {
    
    //Elements UI
    private let scrollView = UIScrollView()
    private let nameStudent = SDCTextField()
    private let lastNameStudent = SDCTextField()
    private let numberGrade = SDCTextField()
    private let mathematics = SDCTextField()
    private let history = SDCTextField()
    private let science = SDCTextField()
    private let art = SDCTextField()
    private let average = UILabel()
    private let saveQualification = UIButton()
    private let subjectsPicker = UIPickerView()
    
    let viewModel = RegisterViewModel()
    
    override func loadView() {
        super.loadView()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        stateButton()
    }
    
    private func setUI(){
        let screen = UIScreen.main.bounds
        nameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Nombre del estudiante")
        nameStudent.valueType = .fullName
        lastNameStudent.configureTextField(keyboard: .alphabet, placeHolder: "Apellido del estudiante")
        nameStudent.valueType = .fullName
        numberGrade.configureTextField(keyboard: .numberPad, placeHolder: "Grado")
        numberGrade.inputView = subjectsPicker
        mathematics.configureTextField(keyboard: .numberPad, placeHolder: "Matemáticas")
        mathematics.valueType = .onlyNumbers
        mathematics.maxLength = 2
        self.history.configureTextField(keyboard: .numberPad, placeHolder: "Historia")
        self.history.valueType = .onlyNumbers
        self.history.maxLength = 2
        self.science.configureTextField(keyboard: .numberPad, placeHolder: "Ciencias")
        self.science.valueType = .onlyNumbers
        self.science.maxLength = 2
        self.art.configureTextField(keyboard: .numberPad, placeHolder: "Artes")
        self.art.valueType = .onlyNumbers
        self.art.maxLength = 2
        average.text = "El priomedio se calculará en automático al llenar todas las materias"
        average.adjustsFontSizeToFitWidth = true
        average.numberOfLines = 2
        average.textAlignment = .center
        saveQualification.backgroundColor = .lightGray
        saveQualification.isEnabled = false
        saveQualification.layer.cornerRadius = 25
        saveQualification.setTitleColor(.white, for: .normal)
        saveQualification.setTitle("Guardar Calificación", for: .normal)
        saveQualification.addTarget(self, action: #selector(addNewRegister), for: .touchUpInside)
        tagTextField(textFields: [nameStudent, lastNameStudent, numberGrade, mathematics, history, science, art], view: self)
        addViewsCustom(view: view, views: [scrollView])
        addViewsCustom(view: scrollView, views: [nameStudent, lastNameStudent, numberGrade, mathematics, history, science, art, average, saveQualification])
        NSLayoutConstraint.activate([
            //ScrollView
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            //NameStudent
            nameStudent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            nameStudent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            nameStudent.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            nameStudent.heightAnchor.constraint(equalToConstant: 45),
            //LastNameStudent
            lastNameStudent.topAnchor.constraint(equalTo: nameStudent.bottomAnchor, constant: 20),
            lastNameStudent.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lastNameStudent.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            lastNameStudent.heightAnchor.constraint(equalToConstant: 45),
            //GradeStudent
            numberGrade.topAnchor.constraint(equalTo: lastNameStudent.bottomAnchor, constant: 20),
            numberGrade.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberGrade.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            numberGrade.heightAnchor.constraint(equalToConstant: 45),
            //Math
            mathematics.topAnchor.constraint(equalTo: numberGrade.bottomAnchor, constant: 20),
            mathematics.leadingAnchor.constraint(equalTo: numberGrade.leadingAnchor),
            mathematics.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            mathematics.heightAnchor.constraint(equalToConstant: 45),
            //History
            history.topAnchor.constraint(equalTo: numberGrade.bottomAnchor, constant: 20),
            history.trailingAnchor.constraint(equalTo: numberGrade.trailingAnchor),
            history.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            history.heightAnchor.constraint(equalToConstant: 45),
            //Science
            science.topAnchor.constraint(equalTo: mathematics.bottomAnchor, constant: 20),
            science.leadingAnchor.constraint(equalTo: numberGrade.leadingAnchor),
            science.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            science.heightAnchor.constraint(equalToConstant: 45),
            //Art
            art.topAnchor.constraint(equalTo: history.bottomAnchor, constant: 20),
            art.trailingAnchor.constraint(equalTo: numberGrade.trailingAnchor),
            art.widthAnchor.constraint(equalToConstant: screen.width * 0.40),
            art.heightAnchor.constraint(equalToConstant: 45),
            //Average
            average.topAnchor.constraint(equalTo: art.bottomAnchor, constant: 20),
            average.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            average.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            average.heightAnchor.constraint(equalToConstant: 45),
            //SaveButton
            saveQualification.topAnchor.constraint(equalTo: average.bottomAnchor, constant: 20),
            saveQualification.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            saveQualification.widthAnchor.constraint(equalToConstant: screen.width * 0.90),
            saveQualification.heightAnchor.constraint(equalToConstant: 45)
        ])
        subjectsPicker.delegate = self
        subjectsPicker.dataSource = self
        for case let textField as SDCTextField in scrollView.subviews {
            textField.addTarget(self, action: #selector(changeStateButton(_:)), for: .editingChanged)
            textField.addDoneCancelToolbar()
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
        let qualifications = [mathematics.text, history.text, science.text, art.text]
        let average = viewModel.checkAverage(subs: qualifications)
        self.average.text = average
        self.saveQualification.isEnabled = enabled
        self.saveQualification.backgroundColor = color
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
            self.stateButton()
            self.viewModel.goToQualification(vc: self)
        }
    }
    
    private func stateButton(){
        saveQualification.isEnabled = false
        saveQualification.backgroundColor = .lightGray
        for case let textField as SDCTextField in self.scrollView.subviews {
            textField.text = ""
        }
        self.average.text = "El priomedio se calculará en automático al llenar todas las materias"
        self.nameStudent.resignFirstResponder()
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
