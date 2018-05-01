//
//  DateViewController.swift
//  Tab Bar
//
//  Created by Sreya Guha on 3/27/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
//

import UIKit
import UserNotifications

class DateViewController: UIViewController {
    var fiveMinsTimer: Timer!
    var thirtyMinsTimer: Timer!
    var oneHourTimer: Timer!
    var oneDayTimer: Timer!
    var twoDaysTimer: Timer!
    var meetingTime: Date!

    var datePicker = UIDatePicker()
    var time = Date()
    var isGrantedNotificationAccess = false

    @IBOutlet weak var meetingPicker: UIDatePicker!
    
    @IBOutlet weak var twoDays: UISwitch!
    @IBOutlet weak var fiveMins: UISwitch!
    @IBOutlet weak var thirtyMins: UISwitch!
    
    @IBOutlet weak var oneDay: UISwitch!
    
    @IBOutlet weak var oneHour: UISwitch!
    
    @IBAction func meetingAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        let meetingTime = meetingPicker.date
        meetingTime.timeIntervalSinceNow

        let defaults = UserDefaults.standard
        let meeting = defaults.integer(forKey: "meetingTime")
       
    }
       // var StringDate = dateFormatter.string(from: datePicker.date)
        
        
    @IBAction func createMeeting(_ sender: UIButton) {
        meetingTime = meetingPicker.date
        var secondDifference = meetingTime.timeIntervalSinceNow
        if oneHour.isOn {
            oneHourTimer =  Timer.scheduledTimer(timeInterval: secondDifference - 3600, target: self, selector: #selector(meetingReminder), userInfo: nil, repeats: true) //talk w group about repeat
            
        } else if fiveMins.isOn {
            fiveMinsTimer = Timer.scheduledTimer(timeInterval: secondDifference - 240, target: self, selector: #selector(meetingReminder), userInfo: nil, repeats: true) //talk w group about repeat
        } else if thirtyMins.isOn {
            thirtyMinsTimer = Timer.scheduledTimer(timeInterval: secondDifference - 1800, target: self, selector: #selector(meetingReminder), userInfo: nil, repeats: true) //talk w group about repeat
        }
        else if oneDay.isOn {
            oneDayTimer = Timer.scheduledTimer(timeInterval: secondDifference - 86400, target: self, selector: #selector(meetingReminder), userInfo: nil, repeats: true) //talk w group about repeat
        } else if twoDays.isOn {
            twoDaysTimer = Timer.scheduledTimer(timeInterval: secondDifference - 172800, target: self, selector: #selector(meetingReminder), userInfo: nil, repeats: true) //talk w group about repeat
        }
    }

    // if let timer is nil, timer invalidate
    @objc func meetingReminder () {
        let content = UNMutableNotificationContent()
        content.title = "Peer tutoring alert"
        content.body = "You have a meeting on " + String(describing: meetingPicker.date)
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
        }
        )
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
        //


