//
//  WeekTableViewCell.swift
//  WeatherApp
//
//  Created by саргашкаева on 6.07.2022.
//

import UIKit

class WeekTableViewCell: UITableViewCell {
    
    // MARK: - Cell identifier
    static let identifier = "Weekcell"
    
    
    
    // MARK: - Top Views
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Partly cloudly"
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
    
    let monday = WeekWeather(image: "sun", day: "Monday", temperature: "72°/28°")
    let tuesday = WeekWeather(image: "cloudSun", day: "Tuesday", temperature: "73°/27°")
    let wednesday = WeekWeather(image: "cloud", day: "Wednesday", temperature: "73°/26°")
    let thursday = WeekWeather(image: "rainSun", day: "Thursday", temperature: "73°/22°")
    let friday = WeekWeather(image: "rain", day: "Friday", temperature: "73°/25°")
    let saturday = WeekWeather(image: "rain", day: "Saturday", temperature: "68°/22°")
    
    private let weekWeather: WeekWeather = {
        let view = WeekWeather()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 0
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
        addSubviews()
        setUpConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(vectorImageView)
        contentView.addSubview(dateLabel)
        contentView.addSubview(weekWeather)
        contentView.addSubview(verticalStack)
        
        verticalStack.addArrangedSubview(monday)
        verticalStack.addArrangedSubview(tuesday)
        verticalStack.addArrangedSubview(wednesday)
        verticalStack.addArrangedSubview(thursday)
        verticalStack.addArrangedSubview(friday)
        verticalStack.addArrangedSubview(saturday)
    }
    
    private func setUpConstraints() {
        let constraints = [
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            vectorImageView.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: 24),
            vectorImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -29),
            vectorImageView.widthAnchor.constraint(equalToConstant: 14),
            vectorImageView.heightAnchor.constraint(equalToConstant: 10),
            dateLabel.topAnchor.constraint(equalTo: vectorImageView.topAnchor, constant: 7),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            dateLabel.heightAnchor.constraint(equalToConstant: 24),
            weekWeather.topAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 25),
            weekWeather.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weekWeather.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weekWeather.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            verticalStack.topAnchor.constraint(equalTo: weekWeather.topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: weekWeather.leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: weekWeather.trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: weekWeather.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
