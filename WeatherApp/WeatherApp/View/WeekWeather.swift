//
//  WeekWeather.swift
//  WeatherApp
//
//  Created by саргашкаева on 8.07.2022.
//

import UIKit

class WeekWeather: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    init(image: String, day: String, temperature: String) {
        super.init(frame: .zero)
        weatherImageView.image = UIImage(named: image)
        dayLabel.text = day
        tempLabel.text = temperature
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    
       let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
        
       let dayLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "Poppins-Regular", size: 17)
            label.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        } ()
    
        
    
        let tempLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .right
            label.font = UIFont(name: "Poppins-Regular", size: 14)
            label.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        } ()
    
    
        private let weatherDayStackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 16
            stack.distribution = .fillProportionally
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        } ()
    
    
        private let horizontalStackview: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        } ()
    
    // MARK: - ConfigureUI
    
    private func configureUI() {
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews() {
        addSubview(weatherDayStackView)
        weatherDayStackView.addArrangedSubview(weatherImageView)
        weatherDayStackView.addArrangedSubview(dayLabel)
        addSubview(horizontalStackview)
        horizontalStackview.addArrangedSubview(weatherDayStackView)
        horizontalStackview.addArrangedSubview(tempLabel)
    }
    
    private func setUpConstraints() {
        let constraints = [
            horizontalStackview.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            horizontalStackview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            horizontalStackview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
