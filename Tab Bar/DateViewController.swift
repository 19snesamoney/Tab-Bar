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
    
    @IBOutlet weak var oneDay: UISwitch!
    
    @IBOutlet weak var oneHour: UISwitch!
    
    @IBAction func meetingAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        let meetingTime = meetingPicker.date
        meetingTime.timeIntervalSinceNow

        let defaults = UserDefaults.standard
        let meeting = defaults.integer(forKey: "meetingTime")
       

       // var StringDate = dateFormatter.string(from: datePicker.date)
        
        
    @IBAction func createMeeting(_ sender: UIButton) {
        meetingTime = meetingPicker.date
        var secondDifference = meetingTime.timeIntervalSinceNow
        if oneHour.isOn {
            oneHourTimer =  Timer.scheduledTimer(timeInterval: secondDifference, target: self, selector: #selector(meetingReminder), userInfo: nil, repeats: true) //talk w group about repeat
            
        }
    }

    // if let timer is nil, timer invalidate
    @objc func meetingReminder () {
        
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


