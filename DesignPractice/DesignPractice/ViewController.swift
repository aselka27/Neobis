//
//  ViewController.swift
//  DesignPractice
//
//  Created by саргашкаева on 6.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // MARK: - Views
    let mainImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Rectangle 683")
        //  image.contentMode =
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    let channelLabel: UILabel = {
        let label = UILabel()
        label.text = "WC Channel"
        label.font = UIFont(name: "PoppinsMedium-Regular", size: 12)
        label.textColor = .systemBlue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    } ()
    
    let dotImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Ellipse 20")
        image.contentMode = .scaleAspectFit
        image.tintColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "14 minutes ago"
        label.textColor = UIColor(red: 0.627, green: 0.596, blue: 0.682, alpha: 1)
        label.font = UIFont(name: "Poppins-Regular", size: 12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    } ()
    
    let firstStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Here's what to expect from Tuesday weather forecast"
        label.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstTextView: UITextView = {
        let textView = UITextView()
        textView.text = "The contrast and colors employed when designing user interface elements can have a huge impact on their accessibility to all end-users. Relying solely on color distinctions limits the ability of color blind individuals to use your product. Using light and dark colors combined with techniques such as cross-hatching to differentiate part of the interface make it more accessible for users with vision issues."
        textView.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = UIColor(red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0, alpha: 1.0)
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    } ()
    
    let secondTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Nature and art are resources for color inspiration in UI concepts that you would be wise to use."
        textView.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.backgroundColor = UIColor(red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0, alpha: 1.0)
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    } ()
    
    let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    let bottomView: BottomView = {
        let view = BottomView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Configure UI
    
    private func configureUI() {
        view.backgroundColor = UIColor(red: 233.0/255.0, green: 233.0/255.0, blue: 233.0/255.0, alpha: 1.0)
        addSubviews()
        setUpNavigation()
        setUpConstraints()
    }
    
    private func addSubviews() {
        view.addSubview(mainImageView)
        view.addSubview(firstStackView)
        
        firstStackView.addArrangedSubview(channelLabel)
        firstStackView.addArrangedSubview(dotImageView)
        firstStackView.addArrangedSubview(timeLabel)
        
        view.addSubview(descriptionLabel)
        
        view.addSubview(labelStack)
        
        labelStack.addArrangedSubview(firstTextView)
        labelStack.addArrangedSubview(secondTextView)
        
        view.addSubview(bottomView)
    }
    
    private func setUpConstraints() {
        let constraints = [
            mainImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            firstStackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 16),
            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            
            labelStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            labelStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            labelStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            firstTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            firstTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            firstTextView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -16),
            firstTextView.heightAnchor.constraint(equalToConstant: 288 ),
            
            secondTextView.topAnchor.constraint(equalTo: firstTextView.bottomAnchor, constant: 23),
            secondTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            secondTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            secondTextView.heightAnchor.constraint(equalToConstant: 78),
            
            bottomView.heightAnchor.constraint(equalToConstant: 56),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setUpNavigation () {
        navigationItem.title = "News"
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action:#selector(infoTap))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        navigationItem.leftBarButtonItem = .init(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backTap))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
    }
    
    
    // MARK: - Selectors
    @objc
    private func backTap () {
        
    }
    
    @objc
    private func infoTap () {
        
    }
}

