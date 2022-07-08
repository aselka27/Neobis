//
//  ViewController.swift
//  WeatherApp
//
//  Created by саргашкаева on 3.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Views
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(DayTableViewCell.self, forCellReuseIdentifier: DayTableViewCell.identifier)
        table.register(WeekTableViewCell.self, forCellReuseIdentifier: WeekTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    } ()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Selectors
    @objc
    func searchTap () {}
    
    @objc
    func infoTap () {}
    
    // MARK: - Configure UI
    private func configureUI() {
        self.tableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        setNavigationBars()
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews () {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setNavigationBars () {
        
        navigationItem.title = "Weather"
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action:#selector(searchTap))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        navigationItem.leftBarButtonItem = .init(image: UIImage(named: "Vector"), style: .plain, target: self, action: #selector(infoTap))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
    }
    
    private func setUpConstraints() {
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}

// MARK: - TablewViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(indexPath.section) {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: DayTableViewCell.identifier, for: indexPath) as! DayTableViewCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: WeekTableViewCell.identifier, for: indexPath) as! WeekTableViewCell
            return cell
        }
    }
}


// MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0)
        {
            if (indexPath.row == 0)
            {
                return 240
            }
        }
        else
        {
            return 400;
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section
        {
        case 0:
            return ""
        default:
            return "Forecast"
        }
    }
}

