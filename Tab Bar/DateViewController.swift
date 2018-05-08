//
//  DateViewController.swift
//  Tab Bar
//
//  Created by Sreya Guha on 3/27/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
//

import UIKit
import UserNotifications

class DateViewController: UIViewController, UNUserNotificationCenterDelegate {
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
            let content = UNMutableNotificationContent()
            content.title = "Meeting alert"
            content.body = "You have a meeting on " + String(describing: meetingPicker.date)
            content.badge = 1
            
            //getting the notification trigger
            //it will be called after 5 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondDifference - 3600, repeats: false)
            
            //getting the notification request
            let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
            
            // You must add UNUserNotificationCenterDelegate to class header
            UNUserNotificationCenter.current().delegate = (self as! UNUserNotificationCenterDelegate)
            
            //adding the notification to notification center
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        } else if fiveMins.isOn {
            let content = UNMutableNotificationContent()
            content.title = "Meeting alert"
            content.body = "You have a meeting on " + String(describing: meetingPicker.date)
            content.badge = 1
            
            //getting the notification trigger
            //it will be called after 5 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondDifference - 300, repeats: false)
            
            //getting the notification request
            let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
            
            // You must add UNUserNotificationCenterDelegate to class header
            UNUserNotificationCenter.current().delegate = self
            
            //adding the notification to notification center
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        } else if thirtyMins.isOn {
            let content = UNMutableNotificationContent()
            content.title = "Meeting alert"
            content.body = "You have a meeting on " + String(describing: meetingPicker.date)
            content.badge = 1
            
            //getting the notification trigger
            //it will be called after 5 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondDifference - 1800, repeats: false)
            
            //getting the notification request
            let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
            
            // You must add UNUserNotificationCenterDelegate to class header
            UNUserNotificationCenter.current().delegate = (self as! UNUserNotificationCenterDelegate)
            
            //adding the notification to notification center
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
        else if oneDay.isOn {
            let content = UNMutableNotificationContent()
            content.title = "Meeting alert"
            content.body = "You have a meeting on " + String(describing: meetingPicker.date)
            content.badge = 1
            
            //getting the notification trigger
            //it will be called after 5 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondDifference - 86400, repeats: false)
            
            //getting the notification request
            let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
            
            // You must add UNUserNotificationCenterDelegate to class header
            UNUserNotificationCenter.current().delegate = (self as! UNUserNotificationCenterDelegate)
            
            //adding the notification to notification center
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        } else if twoDays.isOn {
            let content = UNMutableNotificationContent()
            content.title = "Meeting alert"
            content.body = "You have a meeting on " + String(describing: meetingPicker.date)
            content.badge = 1
            
            //getting the notification trigger
            //it will be called after 5 seconds
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: secondDifference - 172800, repeats: false)
            
            //getting the notification request
            let request = UNNotificationRequest(identifier: "SimplifiedIOSNotification", content: content, trigger: trigger)
            
            // You must add UNUserNotificationCenterDelegate to class header
            UNUserNotificationCenter.current().delegate = (self as! UNUserNotificationCenterDelegate)
            
            //adding the notification to notification center
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
    }
    }
    // if let timer is nil, timer invalidate
  
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


