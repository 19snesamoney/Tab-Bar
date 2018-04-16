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
    var time: TimeCalc!
    @IBOutlet weak var meetingPicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let alertsViewController = segue.destination as? AlertsViewController {
            alertsViewController.time = self.time
        }
        
    }
    
    @IBAction func meetingAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        var day: String = dateFormatter.string(from: self.datePicker.date)
        var intDay = Int(day)
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: self.datePicker.date)
        var IntMonth = Int(month)
        dateFormatter.dateFormat = "hh"
        let hour: String = dateFormatter.string(from: self.datePicker.date)
        var IntHour = Int(hour)
        dateFormatter.dateFormat = "mm"
        let minute: String = dateFormatter.string(from: self.datePicker.date)
        var IntMinute = Int(minute)
        print (IntMinute)

       // var StringDate = dateFormatter.string(from: datePicker.date)
        
        
    }
    
        
        //
}

