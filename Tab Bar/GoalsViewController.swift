//
//  SecondViewController.swift
//  Tab Bar
//
//  Created by Sophia Nesamoney on 3/22/18.
//  Copyright © 2018 Sophia Nesamoney. All rights reserved.
//sophia

import UIKit

class GoalsViewController: UIViewController, UITableViewDataSource {
    var toDoList = ["Goal 1", "Goal 2", "Goal 3"]
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //Make edit button work
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
        let item = toDoList[sourceIndexPath.row]
        toDoList.remove(at: sourceIndexPath.row)
        toDoList.insert(item, at: destinationIndexPath.row)
        let defaults = UserDefaults.standard
        defaults.set(toDoList, forKey: "TutoringAppToDoList")
    }
    
    //Delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            toDoList.remove(at: indexPath.row)
            tableView.reloadData()
            let defaults = UserDefaults.standard
            defaults.set(toDoList, forKey: "TutoringAppToDoList")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let defaults = UserDefaults.standard
        toDoList = defaults.object(forKey: "TutoringAppToDoList") as? [String] ?? [String]()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Will appear!
    override func viewWillAppear(_ animated: Bool){
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
    //Unwinding
    
    @IBAction func unwindSaveNewToDo(unwindSegue: UIStoryboardSegue) {
        if let addTaskVC = unwindSegue.source as? AddTaskViewController {
            if addTaskVC.newTask.count != 0 {
                toDoList.append(addTaskVC.newTask)
                let defaults = UserDefaults.standard
                defaults.set(toDoList, forKey: "TutoringAppToDoList")
                
            }
        }
    }
    
    @IBAction func unwindCancelNewToDo(unwindSegue: UIStoryboardSegue) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")
        let text = toDoList[indexPath.row]
        cell!.textLabel?.text = text
        return cell!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // View Controller Code here
    
}
