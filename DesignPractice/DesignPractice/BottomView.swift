//
//  File.swift
//  DesignPractice
//
//  Created by саргашкаева on 7.07.2022.
//

import UIKit

class BottomView: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Weather news"
        label.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        label.font = UIFont(name: "Poppins-SemiBold", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let shareLabel: UILabel = {
        let label = UILabel()
        label.text = "Share it"
        label.textColor = UIColor(red: 0.627, green: 0.596, blue: 0.682, alpha: 1)
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Vector-3"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    // MARK: - Configure UI
    private func configureUI() {
        addSubview()
        setUpConstraints()
    }
    private func addSubview() {
        addSubview(textLabel)
        addSubview(shareLabel)
        addSubview(shareButton)
        
    }
    private func setUpConstraints() {
        let constraints = [
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            shareLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            shareLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            shareButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: shareLabel.leadingAnchor, constant: -11)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
