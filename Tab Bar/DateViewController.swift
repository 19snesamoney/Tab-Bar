//
//  DateViewController.swift
//  Tab Bar
//
//  Created by Sreya Guha on 3/27/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {

    var datePicker = UIDatePicker()
    var time = Date()
    @IBOutlet weak var meetingPicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var twoDays: UISwitch!
    
    @IBOutlet weak var oneDay: UISwitch!
    
    @IBOutlet weak var oneHour: UISwitch!
    
    @IBOutlet weak var thirtyMins: UISwitch!
    
    @IBOutlet weak var fiveMins: UISwitch!
    
    
    @IBAction func meetingAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        let meetingTime = meetingPicker.date
        var meetingTimeCurrent = meetingTime.timeIntervalSinceNow
        
       

       // var StringDate = dateFormatter.string(from: datePicker.date)
        
        
    }
    
    @IBAction func setAlerts(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: meetingTimeCurrent, target: self, selector: #selector(enableSubmitButton), userInfo: nil, repeats: false)
        
    }
    }
    
        //


