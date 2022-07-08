//
//  CustomTableViewCell.swift
//  WeatherApp
//
//  Created by саргашкаева on 4.07.2022.
//

import UIKit

class DayTableViewCell: UITableViewCell {
    
    // MARK: - Cell identifier
    static let identifier = "Daycell"
    
    // MARK: - Views
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Partly cloudly"
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.627, green: 0.596, blue: 0.682, alpha: 1)
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private let vectorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ThreeLines")
        imageView.tintColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "August, 10th 2020"
        label.textColor = UIColor(red: 0.212, green: 0.231, blue: 0.392, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let dayWeather1 = DayWeather(time: "2 PM", image: "sun", temperature: "72°F")
    let dayWeather2 = DayWeather(time: "3 PM", image: "cloudSun", temperature: "70°F")
    let dayWeather3 = DayWeather(time: "4 PM", image: "rainSun", temperature: "69°F")
    let dayWeather4 = DayWeather(time: "5 PM", image: "cloud", temperature: "75°F")
    let dayWeather5 = DayWeather(time: "6 PM", image: "rain", temperature: "76°F")
    
    
    private let dayWeatherView: DayWeather = {
        let view = DayWeather()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private let horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    } ()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear // very important
        layer.masksToBounds = false
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - ConfigureUI
    private func configureUI() {
        contentView.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
       
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(vectorImageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(dayWeatherView)
        contentView.addSubview(horizontalStack)
        
        horizontalStack.addArrangedSubview(dayWeather1)
        horizontalStack.addArrangedSubview(dayWeather2)
        horizontalStack.addArrangedSubview(dayWeather3)
        horizontalStack.addArrangedSubview(dayWeather4)
        horizontalStack.addArrangedSubview(dayWeather5)
    }
    private func setUpConstraints() {
        let constraints = [
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            vectorImageView.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 22),
            vectorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29),
            vectorImageView.widthAnchor.constraint(equalToConstant: 14),
            vectorImageView.heightAnchor.constraint(equalToConstant: 10),
            
            dateLabel.topAnchor.constraint(equalTo: vectorImageView.topAnchor, constant: 7),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            
            dayWeatherView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 26),
            dayWeatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dayWeatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            dayWeatherView.heightAnchor.constraint(equalToConstant: 100),
            
            horizontalStack.topAnchor.constraint(equalTo: dayWeatherView.topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: dayWeatherView.bottomAnchor),
            horizontalStack.leadingAnchor.constraint(equalTo: dayWeatherView.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: dayWeatherView.trailingAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
