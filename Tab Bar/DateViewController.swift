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
    
    func adddatePicker() {
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        
        let currentDate = Date()
        let oneDay = 24 * 60 * 60
        let minDate = currentDate.addingTimeInterval(TimeInterval(0 * oneDay)) // before 10 days from now
       
        datePicker.minimumDate = minDate
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        adddatePicker()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    enum UIDatePickerMode : Int {
        
        case time
        
        case date
        
        case dateAndTime
        
        case countDownTimer
    }
    
    @objc func datePickerChanged(datePicker: UIDatePicker){
        print("date = \(datePicker.date)")
    }
    
    @IBOutlet weak var meetingPicker: UIDatePicker!

    @IBAction func meetingAction(_ sender: Any) {
}
}
