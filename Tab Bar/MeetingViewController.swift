//
//  FirstViewController.swift
//  Tab Bar
//
//  Created by Sophia Nesamoney on 3/22/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
// This is Madeline!
import UIKit

class MeetingViewController: UIViewController, UITableViewDataSource {
    var somethingList = [""]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    //  Make edit button work
    @IBAction func edit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        switch tableView.isEditing {
        case true:
            editButton.title = "Done"
        case false:
            editButton.title = "Edit"
        }
    }
    
    //Allows reordering of table cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = somethingList[sourceIndexPath.row]
        somethingList.remove(at: sourceIndexPath.row)
        somethingList.insert(item, at: destinationIndexPath.row)
        
    }
    
    //Delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            somethingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
    
    //Unwind Save
    @IBAction func unwindSaveNewMeeting(unwindSegue: UIStoryboardSegue) {
        if let newMeetingVC = unwindSegue.source as? AddMeetingViewController {
            if newMeetingVC.subtitleList.count != 0 {
                if newMeetingVC.subtitleList != [""] {
                    somethingList.append(newMeetingVC.subtitleList.first!)
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return somethingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseThing")
        let text = somethingList[indexPath.row]
        cell!.textLabel?.text = text
        return cell!
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}


