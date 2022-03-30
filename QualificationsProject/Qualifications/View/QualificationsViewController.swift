//
//  QualificationsViewController.swift
//  QualificationsProject
//
//  Created by Gustavo on 26/03/22.
//

import UIKit

class QualificationsViewController: BaseViewController {
    
    var viewModel = QualificationsModelView()
    var data = [QualificationRealm]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(QualificationTableViewCell.self, forCellReuseIdentifier: QualificationTableViewCell.identifier)
        return table
    }()
    
    let segment: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Todos", "1 Semestre", "2 Semestre", "3 Semestre", "4 Semestre"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    let search: UISearchBar = {
        let search = UISearchBar()
        search.searchTextField.addDoneCancelToolbar()
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        search.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        data = viewModel.allStudents()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(tableView)
        view.addSubview(segment)
        navigationItem.titleView = search
        segment.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segment.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.95),
            segment.heightAnchor.constraint(equalToConstant: 40),
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            data = viewModel.allStudents()
        case 1:
            data = viewModel.fistGrade()
        case 2:
            data = viewModel.secondGrade()
        case 3:
            data = viewModel.thredGrade()
        case 4:
            data = viewModel.fourtGrade()
        default:
            break
        }
        tableView.reloadData()
    }
}

extension QualificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QualificationTableViewCell.identifier, for: indexPath) as? QualificationTableViewCell else { return UITableViewCell() }
        cell.configureDataCell(data: data[indexPath.row])
        return cell
    }
}

extension QualificationsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        data = viewModel.filterWithName(name: searchText)
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
