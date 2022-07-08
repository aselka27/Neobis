//
//  File.swift
//  WeatherApp
//
//  Created by саргашкаева on 4.07.2022.
//

import UIKit
class DayWeather: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    init(time: String, image: String, temperature: String) {
        super.init(frame: .zero)
        timeLabel.text = time
        weatherImageView.image = UIImage(named: image)
        tempLabel.text = temperature
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Views
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Regular", size: 12)
        label.textColor = UIColor(red: 0.627, green: 0.596, blue: 0.682, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let firstStackView: UIStackView = {
        let stackView = UIStackView ()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    
    // MARK: - ConfigureUI
    
    private func configureUI () {
        setUpSubviews()
        setUpConstraints()
    }
    private func setUpSubviews () {
        addSubview(firstStackView)
        
        firstStackView.addArrangedSubview(timeLabel)
        firstStackView.addArrangedSubview(weatherImageView)
        firstStackView.addArrangedSubview(tempLabel)
    }
    private func setUpConstraints () {
        let constraints = [
            firstStackView.topAnchor.constraint(equalTo: topAnchor),
            firstStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
