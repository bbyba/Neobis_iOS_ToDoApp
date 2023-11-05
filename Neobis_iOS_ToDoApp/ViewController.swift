//
//  ViewController.swift
//  Neobis_iOS_ToDoApp
//
//  Created by Burte Bayaraa on 2023.11.03.
//
//

import UIKit

//struct Task{        //structure for a single task
//    var title:String
//    var details: String
//}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    var tasks: [AddViewController.Task] = []      //an array to store the tasks
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)        //reuses the hidden cells
        
        let task = tasks[indexPath.row]
        cell.textLabel?.text = task.title   //display the title
        
        return cell
    }
    
    //
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    //deselects the selected row
    }
    
    //AddViewControllerDelegate Method
    func didAddTask(_ task: AddViewController.Task) {
            tasks.append(task) // Add the new task to the tasks array
            tableView.reloadData() // Refresh the table view
        }
    
    func showAddViewController() {
        if let addViewController = storyboard?.instantiateViewController(withIdentifier: "AddViewController") as? AddViewController {
            addViewController.delegate = self // Set ViewController as the delegate
            present(addViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        showAddViewController()
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
//    func deleteTask(at Index: IndexPath){
//        
//    }
//
}
