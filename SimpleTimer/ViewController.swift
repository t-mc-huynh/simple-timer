//
//  ViewController.swift
//  SimpleTimer
//
//  Created by Tina Huynh on 12/30/18.
//  Copyright © 2018 Tina Huynh. All rights reserved.
//

import UIKit

fileprivate func setFont(_ myFont: UILabel) {
    myFont.font = myFont.font.withSize(40)
    myFont.textColor = .black
    myFont.textAlignment = .center
    myFont.adjustsFontSizeToFitWidth = true
    myFont.allowsDefaultTighteningForTruncation = true
    myFont.translatesAutoresizingMaskIntoConstraints = false
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(inputsContainerView)
        
        addTimeLabelView()
        addButtonsView()
        
        setUpInputsContainer()
        setUpTimeContainer()
        
        setUpStartContainer()
        setUpPauseContainer()
        setUpResetContainer()
    }
    
    func addTimeLabelView() {
        view.addSubview(hoursLabel)
        view.addSubview(minutesLabel)
        view.addSubview(secondsLabel)
        view.addSubview(semicolonLabel1)
        view.addSubview(semicolonLabel2)
    }
    
    func addButtonsView() {
        view.addSubview(startButton)
        view.addSubview(pauseButton)
        view.addSubview(resetButton)
    }
    
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let semicolonLabel1: UILabel = {
        let semicolon1 = UILabel()
        semicolon1.text = ":"
        setFont(semicolon1)
        return semicolon1
    }()
    
    let semicolonLabel2: UILabel = {
        let semicolon2 = UILabel()
        semicolon2.text = ":"
        setFont(semicolon2)
        return semicolon2
    }()
    
    let hoursLabel: UILabel = {
        let hours = UILabel()
        hours.text = "00"
        setFont(hours)
        return hours
    }()
    
    let minutesLabel: UILabel = {
        let minutes = UILabel()
        minutes.text = "00"
        setFont(minutes)
        return minutes
    }()
    
    let secondsLabel: UILabel = {
        let seconds = UILabel()
        seconds.text = "00"
        setFont(seconds)
        return seconds
    }()
    
    var time = 0.00
    var timer = Timer()
    
    lazy var startButton: UIButton = {
        let start = UIButton(type: .system)
        start.setTitle("Start", for: .normal)
        start.backgroundColor = .blue
        start.setTitleColor(UIColor.white, for: .normal)
        start.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        start.translatesAutoresizingMaskIntoConstraints = false
        
        start.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        return start
    }()
    
    @objc func startButtonAction() {
        print("start")
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    @objc func action() {
        time += 1
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        hoursLabel.text = String(format: "%02i", hours)
        minutesLabel.text = String(format: "%02i", minutes)
        secondsLabel.text = String(format: "%02i", seconds)
    }
    
    lazy var pauseButton: UIButton = {
        let pause = UIButton(type: .system)
        pause.setTitle("Pause", for: .normal)
        pause.backgroundColor = .green
        pause.setTitleColor(UIColor.white, for: .normal)
        pause.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        pause.translatesAutoresizingMaskIntoConstraints = false
        
        pause.addTarget(self, action: #selector(pauseButtonAction), for: .touchUpInside)
        return pause
    }()
    
    @objc func pauseButtonAction() {
        print("pause")
        timer.invalidate()
    }
    
    lazy var resetButton: UIButton = {
        let reset = UIButton(type: .system)
        reset.setTitle("Reset", for: .normal)
        reset.backgroundColor = .red
        reset.setTitleColor(UIColor.white, for: .normal)
        reset.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        reset.translatesAutoresizingMaskIntoConstraints = false
        
        reset.addTarget(self, action: #selector(resetActionButton), for: .touchUpInside)
        return reset
    }()
    
    @objc func resetActionButton() {
        print("reset")
        timer.invalidate()
        hoursLabel.text = String(format: "%02i", 00)
        minutesLabel.text = String(format: "%02i", 00)
        secondsLabel.text = String(format: "%02i", 00)
    }
    
    func setUpInputsContainer() {
        inputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        inputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        inputsContainerView.addSubview(hoursLabel)
        inputsContainerView.addSubview(minutesLabel)
        inputsContainerView.addSubview(secondsLabel)
        inputsContainerView.addSubview(semicolonLabel1)
        inputsContainerView.addSubview(semicolonLabel2)
    }
    
    func setUpTimeContainer() {
        setUpHoursContainer()
        setUpMinutesContainer()
        setUpSecondsContainer()
        setUpSemicolonContainer1()
        setUpSemicolonContainer2()
    }
    
    func setUpHoursContainer() {
        // need x, y, width, and height constraints
        hoursLabel.centerYAnchor.constraint(equalTo: minutesLabel.centerYAnchor).isActive = true
        hoursLabel.trailingAnchor.constraint(equalTo: semicolonLabel1.leadingAnchor, constant: 4).isActive = true
        hoursLabel.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/5).isActive = true
        hoursLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpSemicolonContainer1() {
        // need x, y, width, and height constraints
        semicolonLabel1.centerYAnchor.constraint(equalTo: minutesLabel.centerYAnchor).isActive = true
        semicolonLabel1.trailingAnchor.constraint(equalTo: minutesLabel.leadingAnchor, constant: 4).isActive = true
        semicolonLabel1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        semicolonLabel1.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpMinutesContainer() {
        // need x, y, width, and height constraints
        minutesLabel.centerXAnchor.constraint(equalTo: inputsContainerView.centerXAnchor).isActive = true
        minutesLabel.centerYAnchor.constraint(equalTo: inputsContainerView.centerYAnchor).isActive = true
        minutesLabel.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/5).isActive = true
        minutesLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpSemicolonContainer2() {
        // need x, y, width, and height constraints
        semicolonLabel2.centerYAnchor.constraint(equalTo: minutesLabel.centerYAnchor).isActive = true
        semicolonLabel2.leadingAnchor.constraint(equalTo: minutesLabel.trailingAnchor, constant: 4).isActive = true
        semicolonLabel2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        semicolonLabel2.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpSecondsContainer() {
        // need x, y, width, and height constraints
        secondsLabel.centerYAnchor.constraint(equalTo: minutesLabel.centerYAnchor).isActive = true
        secondsLabel.leadingAnchor.constraint(equalTo: semicolonLabel2.trailingAnchor, constant: 4).isActive = true
        secondsLabel.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor, multiplier: 1/5).isActive = true
        secondsLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpStartContainer() {
        // need x, y, width, and height constraints
        startButton.centerXAnchor.constraint(equalTo: minutesLabel.centerXAnchor).isActive = true
        startButton.topAnchor.constraint(equalTo: hoursLabel.bottomAnchor, constant: 10).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpPauseContainer() {
        // need x, y, width, and height constraints
        pauseButton.centerXAnchor.constraint(equalTo: minutesLabel.centerXAnchor).isActive = true
        pauseButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10).isActive = true
        pauseButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        pauseButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setUpResetContainer() {
        // need x, y, width, and height constraints
        resetButton.centerXAnchor.constraint(equalTo: minutesLabel.centerXAnchor).isActive = true
        resetButton.topAnchor.constraint(equalTo: pauseButton.bottomAnchor, constant: 10).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

