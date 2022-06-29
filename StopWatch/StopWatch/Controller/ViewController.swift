//
//  ViewController.swift
//  StopWatch
//
//  Created by саргашкаева on 27.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var counter = 0
    var isRunning = false
    var timer = Timer()
    
    
    // MARK: - Views
    
    let stopWatchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage (systemName: "stopwatch")
        imageView.tintColor = .black
        
        imageView.frame = .init(x: 0, y: 0, width: 50, height: 50)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    } ()
    
    let segmentedControl: UISegmentedControl = {
        let items = ["Stopwatch", "Timer"]
        let sControl = UISegmentedControl(items: items)
        sControl.translatesAutoresizingMaskIntoConstraints = false
        return sControl
    } ()
    
    let timeLabel: UILabel = {
        let label = UILabel ()
        label.text = "00:00:00"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let pauseButton: UIButton = {
        let button = UIButton ()
        button.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        button.tintColor = .black
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    } ()
    
    let resetButton: UIButton = {
        let button = UIButton ()
        button.setImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
        button.tintColor = .black
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    let startButton: UIButton = {
        let button = UIButton ()
        button.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        button.tintColor = .black
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 50), forImageIn: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView ()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    
    let timerPickerView: UIPickerView = {
        let pickerView = UIPickerView ()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    } ()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc
    func startButtonClick () {
        if !isRunning {
            
            startButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            resetButton.setImage(UIImage(systemName: "stop.circle.fill"), for: .normal)
            pauseButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            
            if timerPickerView.isHidden == true {
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(stopwatchRun), userInfo: nil, repeats: true)
                isRunning = true
                }
            
            if !timerPickerView.isHidden {
                timerRun()
                isRunning = true
                }
        }
    }
    
    @objc
    func pauseButtonClick () {
        timer.invalidate()
        startButton.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
        pauseButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
        isRunning = false
    }
    
    @objc
    func resetButtonClick () {
        timer.invalidate()
        isRunning = false
        counter = 0
        pauseButton.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        timeLabel.text = "00:00:00"
    }
    
    @objc
    func changeView () {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            startButton.isSelected = false
            stopWatchImageView.image = UIImage(systemName: "stopwatch")
            timerPickerView.isHidden = true
        default:
            stopWatchImageView.image = UIImage(systemName: "timer")
            timerPickerView.isHidden = false
        }
    }
    
    @objc
    func stopwatchRun () {
        counter += 1
        let hour = counter / 3600
        var hourString = "\(hour)"
        if (hour < 10) {
            hourString = "0\(hour)"
        }
        
        let minute = (counter % 3600) / 60
        var minuteString = "\(minute)"
        if (minute < 10) {
            minuteString = "0\(minute)"
        }
        
        let second = (counter % 3600) % 60
        var secondString = "\(second)"
        if (second < 10) {
            secondString = "0\(second)"
        }
        
        timeLabel.text = "\(hourString):\(minuteString):\(secondString)"
    }
    
    @objc
    func timerRun () {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ tempTimer in
            if self.seconds == 0 && self.minutes != 0 {
                self.minutes -= 1
                self.seconds = 59
            } else if self.minutes == 0 && self.hours != 0 {
                self.hours -= 1
                self.minutes = 59
                self.seconds = 59
            } else if self.minutes == 0 && self.hours == 0 && self.seconds == 0 {
                self.timer.invalidate()
                
            } else {
                self.seconds -= 1
            }
            
            self.timeLabel.text = String(format:"%02i:%02i:%02i", self.hours, self.minutes, self.seconds)
        }
    }
    
    
    // MARK: - ConfigureUI
    
    fileprivate func configureUI () {
        view.backgroundColor = .systemYellow
        view.addSubview(stopWatchImageView)
        view.addSubview(segmentedControl)
        view.addSubview(timeLabel)
        view.addSubview(buttonsStackView)
        
        buttonsStackView.addArrangedSubview(resetButton)
        buttonsStackView.addArrangedSubview(pauseButton)
        buttonsStackView.addArrangedSubview(startButton)
        
        view.addSubview(buttonsStackView)
        
        timerPickerView.dataSource = self
        timerPickerView.delegate = self
        view.addSubview(timerPickerView)
        timerPickerView.isHidden = true
        
        segmentedControl.selectedSegmentIndex = 0
        
        setConstraints()
        addObservableTarget()
    }
    
    fileprivate func setConstraints () {
        let constraints = [
            
            stopWatchImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stopWatchImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopWatchImageView.widthAnchor.constraint(equalToConstant: 50),
            stopWatchImageView.heightAnchor.constraint(equalToConstant: 50),
            
            segmentedControl.topAnchor.constraint(equalTo: stopWatchImageView.bottomAnchor, constant: 13),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.widthAnchor.constraint(equalToConstant: 164),
            segmentedControl.heightAnchor.constraint(equalToConstant: 28),
            
            timeLabel.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 50),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            timeLabel.heightAnchor.constraint(equalToConstant: 50),
            
            buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 150),
            
            timerPickerView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            timerPickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timerPickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    fileprivate func addObservableTarget () {
        startButton.addTarget(self, action: #selector(startButtonClick), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector (resetButtonClick), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseButtonClick), for: .touchUpInside)
        segmentedControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
    }
}


// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        default:
            return 60
        }
    }
}


// MARK: - UIPickerViewDelegate

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%0d", row)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            hours = row
        } else if component == 1 {
            minutes = row
        } else {
            seconds = row + 1
        }
    }
}
