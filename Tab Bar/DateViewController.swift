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
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        var StringDate = dateFormatter.string(from: datePicker.date)
        print (time.calculateMonth(StringMonth: StringDate))
        
        
    }
    
        
        //
}

