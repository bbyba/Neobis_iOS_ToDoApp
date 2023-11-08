//
//  AddViewController.swift
//  Neobis_iOS_ToDoApp
//

import UIKit
import Foundation

protocol AddViewControllerDelegate: AnyObject {
    func saveTasksAction(tasks: [TaskModel])
    func didAddTask(task: TaskModel)
}


class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    weak var delegate: AddViewControllerDelegate?
    
    var tasks: [TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTasks()
    }
    
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty,
              let details = detailsTextField.text, !details.isEmpty else {return}
        
        //        //create a task and add to the tasks array
        //        let task = TaskModel(title: title, details: details, isCompleted: false)
        //        //save and dismiss the view controller by notifying the delegate
        //        tasks.append(task)
        //        saveTasksAction()
        //        delegate?.saveTasksAction(tasks: tasks)
        
        let task = TaskModel(title: title, details: details, isCompleted: false)
        delegate?.didAddTask(task: task)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveTasksAction() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "details": $0.details,
                "isCompleted": $0.isCompleted
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap {
            guard let title = $0["title"] as? String,
                  let details = $0["details"] as? String,
                  let isCompleted = $0["isCompleted"] as? Bool else { return nil }
            return TaskModel(title: title, details: details, isCompleted: isCompleted)
        }
    }
}
