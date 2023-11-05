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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddViewControllerDelegate, UINavigationControllerDelegate {
    
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
        
        // display a checkmark if the task is completed
//        cell.accessoryType = task.isCompleted ? .checkmark : .none
        
        return cell
    }
    
    //
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)    //deselects the selected row
        // Toggle the completion status of the selected task
//        tasks[indexPath.row].isCompleted.toggle()
        tableView.reloadData() // Refresh the table view
    }
    
    //AddViewControllerDelegate Method
    func didAddTask(_ task: AddViewController.Task) {
            tasks.append(task) // Add the new task to the tasks array
            tableView.reloadData() // Refresh the table view
        }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let vc = ViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        navController.delegate = self
        self.present(navController, animated: true, completion: nil)
      }
    
    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
//    func deleteTask(at Index: IndexPath){
//        
//    }
//
}
