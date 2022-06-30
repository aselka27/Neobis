//
//  DetailViewController.swift
//  MixTwoApps
//
//  Created by саргашкаева on 29.06.2022.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    
    func detailVC(controller: DetailViewController, added item: Task)
    func detailVC(controller: DetailViewController, edited item: Task)
}

class DetailViewController: UIViewController {

    // MARK: - Properties
    
    var task: Task?
    var descText = "Описание"
    
    weak var delegate: DetailViewControllerDelegate?
    
    // MARK: - Views
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Название"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 191.0/255.0, green: 190.0/255.0, blue: 192.0/255.0, alpha: 1.0).cgColor
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
        textField.leftView = paddingView
        textField.leftViewMode = .always

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
        
    }()
    
    var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 198.0/255.0, alpha: 0.96)
        textView.textAlignment = .left
        textView.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 191.0/255.0, green: 190.0/255.0, blue: 192.0/255.0, alpha: 1.0).cgColor
        textView.layer.masksToBounds = true
        textView.layer.cornerRadius = 5
        textView.backgroundColor = .white
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        return textView
        
    } ()
    
    
    // MARK: - Init
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Do any additional setup after loading the view.
        descriptionTextView.text = descText
    }
    
    
    // MARK: - Selector
    
    @objc
    fileprivate func saveBar() {
        if let task = task {
            task.taskName = nameTextField.text ?? ""
            task.taskDescription = descriptionTextView.text
            delegate?.detailVC(controller: self, edited: task)
        } else {
            delegate?.detailVC(controller: self, added: Task(taskName: nameTextField.text ?? "", taskDescription: descriptionTextView.text, isClicked: false))
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    fileprivate func cancelBar() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Configure UI
    
    fileprivate func configureUI() {
        view.backgroundColor = UIColor(red: 246.0/255.0, green: 244.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        
        view.addSubview(nameTextField)
        view.addSubview(descriptionTextView)
        
        nameTextField.text = task?.taskName
        descriptionTextView.text = task?.taskDescription
        
        descriptionTextView.delegate = self
        configureNav()
        setConstraints()
        addObservableTarget()
    }
    
    fileprivate func setConstraints() {
        let constraints = [
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
          descriptionTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    fileprivate func configureNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .plain, target: self, action: #selector(saveBar))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена", style: .done, target: self, action: #selector(cancelBar))
        
        navigationItem.leftBarButtonItem?.tintColor = .red
    }
    
    fileprivate func addObservableTarget() {
        
    }
    
    // MARK: - Helpers
    
}

// MARK: - TextView Delegate for adding placeholder
extension DetailViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.text == "Описание" {
            descriptionTextView.text = ""
            descriptionTextView.textColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text.isEmpty {
            descriptionTextView.text = "Описание"
            descriptionTextView.textColor = UIColor(red: 196.0/255.0, green: 196.0/255.0, blue: 198.0/255.0, alpha: 0.96)
        }
    }
    
    
}
