//
//  ViewController.swift
//  toDoList3
//
//  Created by саргашкаева on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // MARK: - Properties
    
    var task: [Task] = [
        Task(taskName: "Задача1", taskDescription: "Подзадача1", isClicked: false),
        Task(taskName: "Задача2", taskDescription: "Подзадача2", isClicked: false),
        Task(taskName: "Задача3", taskDescription: "Подзадача3", isClicked: false)
    ]
    
    // MARK: - Views
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Создайте новую задачу нажав на кнопку плюс."
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var editButton: UIButton = {
        
        let button = UIButton()
        let imageButton = UIImage(systemName: "pencil.circle.fill")
        button.setImage(imageButton, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private var plusButton: UIButton = {
        
        let button = UIButton()
        let imageButton = UIImage(systemName: "plus.circle.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        button.setImage(imageButton, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Init
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc
    fileprivate func onEditButton(){
        tableView.isEditing.toggle()
        plusButton.isHidden.toggle()
        tableView.isEditing ? editButton.setImage(UIImage(systemName: "xmark.circle.fill"), for:.normal) : editButton.setImage(UIImage(systemName: "pencil.circle.fill"), for:.normal)
        
    }
    @objc
    fileprivate func onPlusButton(){
        
        let vc = DetailViewController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Configure UI
    
    fileprivate func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Задачи"
        
        view.addSubview(tableView)
        view.addSubview(textLabel)
        view.addSubview(editButton)
        view.addSubview(plusButton)

        tableView.rowHeight = 70
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setConstraints()
        addObservableTarget()
    }
    
    fileprivate func setConstraints(){
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            plusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            plusButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            
            editButton.bottomAnchor.constraint(equalTo: plusButton.topAnchor, constant: -15),
            editButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            editButton.widthAnchor.constraint(equalToConstant: 50),
            editButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    fileprivate func addObservableTarget(){
        
        editButton.addTarget(self, action: #selector(onEditButton), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(onPlusButton), for: .touchUpInside)
    }
// MARK: - Helpers
    
}
// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if task.count == 0 {
            textLabel.isHidden = false
            return 0
        } else {
            textLabel.isHidden = true
            return task.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        let tasks = task[indexPath.row]
        cell.configure(title: tasks.taskName,
                       subtitle: tasks.taskDescription,
                       isChecked: tasks.isClicked)
        return cell
    }
}
// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell: TaskTableViewCell = tableView.cellForRow(at: indexPath) as? TaskTableViewCell else { return }
        let item = task[indexPath.row]
        item.isClicked.toggle()
        cell.checkCell(bool: item.isClicked)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if tableView.isEditing {
            return
        }
        
        let vc = DetailViewController()
        vc.task = task[indexPath.row]
        vc.descText = task[indexPath.row].taskDescription
        vc.descriptionTextView.textColor = UIColor.black
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = task[sourceIndexPath.row]
        task.remove(at: sourceIndexPath.row)
        task.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            task.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        } else if  editingStyle == .insert {
            let rowIndex = task.count - 1
            let indexPath = IndexPath(row: rowIndex, section: 0)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
}

// MARK: - DetailViewControllerDelegate
extension ViewController: DetailViewControllerDelegate {
    func detailVC(controller: DetailViewController, added item: Task) {
        task.append(Task(taskName: item.taskName, taskDescription: item.taskDescription, isClicked: false))
        let rowIndex = task.count - 1
        let indexPath = IndexPath(row: rowIndex, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    func detailVC(controller: DetailViewController, edited item: Task) {
        if let index = task.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) as? TaskTableViewCell{
                cell.configure(title: item.taskName, subtitle: item.taskDescription, isChecked: item.isClicked)
            }
        }
    }
}
