//
//  ViewController.swift
//  Neobis_iOS_ToDoApp
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, AddViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var tasks: [TaskModel] = []
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func didAddTask(task: TaskModel) {
        tasks.append(task)
        tableView.reloadData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let addVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddViewController") as? AddViewController else {return}
//        let addVC = AddViewController()
        addVC.delegate = self
        addVC.tasks = tasks  // pass the tasks array to AddViewController
        let navController = UINavigationController(rootViewController: addVC)
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true, completion: nil)
    }

    //look at it again!!!!!
    @IBAction func editButtonTapped(_ sender: Any) {
        guard !self.tasks.isEmpty else { return }
        self.tableView.setEditing(true, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.tasks.count
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //reusing cells using dequeueResusibleCell to avoid wasting memory
            let task = self.tasks[indexPath.row]
            cell.textLabel?.text = task.title
            
            // shows the checkmark when displaying a cell
            if task.isCompleted {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
          return "To create a new task click the \"+\" button."
        }
        
        //deleting
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row) // tells which will get removed
        tableView.deleteRows(at: [indexPath], with: .automatic) //with .automatic can delete cells by either pressing the delete button or swiping to delete
    }
        
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
        //method that changes the order of the rows
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
        //or tasks.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func saveTasksAction(tasks: [TaskModel]) {
        self.tasks = tasks
        tableView.reloadData()

    }
}
