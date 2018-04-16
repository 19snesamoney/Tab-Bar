//
//  FirstViewController.swift
//  Tab Bar
//
//  Created by Sophia Nesamoney on 3/22/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
// This is Madeline!
import UIKit

class MeetingViewController: UIViewController {
    var time = TimeCalc()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dateViewController = segue.destination.childViewControllers.first as? DateViewController {
            dateViewController.time = self.time
        }
        
    }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // sreya IS HERE
    // Hi sreya!

    
    
}


