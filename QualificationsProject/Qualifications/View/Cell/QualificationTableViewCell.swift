//
//  QualificationTableViewCell.swift
//  QualificationsProject
//
//  Created by Gustavo on 28/03/22.
//

import UIKit

class QualificationTableViewCell: UITableViewCell {

    let name: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = label.font.withSize(18)
        return label
    }()
    
    let grade: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = label.font.withSize(14)
        return label
    }()
    
    let average: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.font = label.font.withSize(14)
        return label
    }()
    
    let result: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = label.font.withSize(17)
        return label
    }()
    
    static let identifier = "QualificationTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureDataCell(data: QualificationRealm){
        name.text = data.name + " " + data.lastName
        grade.text = data.grade
        average.text = "Promedio: \(data.average)"
        let av = Double(data.average)
        if (av ?? 0.0) <= 7.9 {
            result.text = "Desaprobado"
            result.textColor = .red
        } else {
            result.text = "Aprobado"
            result.textColor = .green
        }
    }
    
    func configureUI(){
        [name, grade, average, result].forEach { label in
            contentView.addSubview(label)
        }
        for case let element as UILabel in contentView.subviews {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        let width = contentView.bounds.width
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            name.heightAnchor.constraint(equalToConstant: 25),
            name.widthAnchor.constraint(equalToConstant: width * 0.90),
            grade.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15),
            grade.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            grade.heightAnchor.constraint(equalToConstant: 25),
            grade.widthAnchor.constraint(equalToConstant: width * 0.40),
            average.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 15),
            average.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            average.heightAnchor.constraint(equalToConstant: 25),
            average.widthAnchor.constraint(equalToConstant: width * 0.40),
            result.topAnchor.constraint(equalTo: average.bottomAnchor, constant: 15),
            result.widthAnchor.constraint(equalToConstant: width * 0.90),
            result.heightAnchor.constraint(equalToConstant: 25),
            result.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            result.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}
