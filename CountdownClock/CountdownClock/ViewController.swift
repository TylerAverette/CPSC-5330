//
//  ViewController.swift
//  CountdownClock
//
//  Created by Shirley Averette on 1/16/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var btnStartStop: UIButton!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    var timer = Timer()
    var player: AVAudioPlayer?
    var selectedTime = 0
    var countdownTimer: Timer?
    let formatter = DateComponentsFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker.backgroundColor = UIColor.black
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(updateCurrentTime) , userInfo: nil, repeats: true)
        buttonSetup()
        timeSelected() // initialization
        datePicker.addTarget(self, action: #selector(timeSelected), for: .valueChanged)
        formatter.allowedUnits = [.hour, .minute, .second]
    }
    
    @objc func updateCurrentTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "a"
        if formatter.string(from: Date()) == "PM" {
            background.image = UIImage(named:"lofi-girl-night")
        } else {
            background.image = UIImage(named:"lofi-girl")
        }
        formatter.dateFormat = "EEEE, dd MMM yyyy HH:mm:ss"
        currentTimeLabel.text = formatter.string(from: Date())
    }
    
    @IBAction func StartStopPressed(_ sender: UIButton) {
        if (btnStartStop.titleLabel?.text == "No Time Remaining") {startTimer()}
        buttonSetup()
    }
    
    @objc func timeSelected() {
        selectedTime = Int(datePicker.countDownDuration)
        remainingTimeLabel.text? = timeToString()
    }
    
    func buttonSetup() {
        print("Called")
        if btnStartStop.titleLabel?.text == "Start Timer" {
            btnStartStop.setTitle("Stop Music", for: .normal)
        } else {
            btnStartStop.setTitle("Start Timer", for: .normal)
        }
    }
    
    func playSound(){
        guard let path = Bundle.main.path(forResource: "timerSound", ofType: "mp3") else {
            return
        }
        if btnStartStop.titleLabel?.text == "Stop Music" {
            buttonSetup()
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
        } catch let error {
            print ("Error" + error.localizedDescription)
        }
        buttonSetup()
    }
    
    @IBAction func startTimerButtonPressed(_ sender: UIButton) {
        selectedTime = Int(datePicker.countDownDuration)
        startTimer()
    }
    
    func startTimer() {
        countdownTimer?.invalidate()
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if selectedTime > 0 {
            remainingTimeLabel.text? = timeToString()
            selectedTime -= 1
        } else {
            countdownTimer?.invalidate()
            remainingTimeLabel.text? = "No Time Remaining"
            timeSelected()
            buttonSetup()
        }
        if selectedTime == 0 {
            playSound()
            btnStartStop.setTitle("Start Timer", for: .normal)
        }
    }
    
    func timeToString() -> String {
        var remainingTime = selectedTime
        let hour = (remainingTime / 60) / 60
        remainingTime -= (hour * 60) * 60
        let minute = remainingTime / 60
        remainingTime -= (minute * 60)
        let second = remainingTime
        var result = ""
        if hour < 10 {
            result = "0\(hour)"
        } else {
            result += "\(hour)"
        }
        if minute < 10 {
            result += ":0\(minute)"
        } else {
            result += ":\(minute)"
        }
        if second < 10 {
            result += ":0\(second)"
        } else {
            result += ":\(second)"
        }
        
        return "\(result)"
    }
}
