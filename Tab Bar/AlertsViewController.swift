//
//  AlertsViewController.swift
//  Tab Bar
//
//  Created by Sophia Nesamoney on 3/26/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
//

import UIKit
import UserNotifications


class AlertsViewController: UIViewController {
    
    var time = Date()
    var isGrantedNotificationAccess = false

    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert,.sound,.badge],
            completionHandler: { (granted,error) in
                self.isGrantedNotificationAccess = granted
        }
        )
    }
        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() { //
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // save button
    @IBOutlet weak var fiveMinOutlet: UISwitch!
    // put save in navigation bar
    @IBAction func fiveMinAction(_ sender: UISwitch) {
        if isGrantedNotificationAccess && fiveMinOutlet.isOn {
            let content = UNMutableNotificationContent()
            content.title = "Meeting Alert"
            content.body = "You have a meeting soon!!"
            content.categoryIdentifier = "message"
            var dateComponents = DateComponents()
            dateComponents.month = 7
            dateComponents.weekday = 6
            dateComponents.hour = 10
            dateComponents.minute = 48
            let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(
                identifier: "10.second.message",
                content: content,
                trigger: notificationTrigger
            )
            UNUserNotificationCenter.current().add(
                request, withCompletionHandler: nil)
        }
    }
}
        

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */





