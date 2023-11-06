//
//  AddViewController.swift
//  Neobis_iOS_ToDoApp
//

import UIKit
import Foundation

//protocol AddViewControllerDelegate: AnyObject {
//    func didAddTask(_ task: AddViewController.Task)
//}

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.setNavigationBarHidden(false, animated: false)
//        cancelButton.isHidden = false
//        saveButton.isHidden = false
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        //unwraps the values for the title and details, and checks if they are empty
        guard let title = titleTextField.text, !title.isEmpty,
                  let details = detailsTextField.text, !details.isEmpty else {
                return
            }

        //create a new task and add to the tasks array
        let task = Task(title: title, details: details, isCompleted: false)     //unchangeable reference to the object, but changeable properties
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
//
//
//func saveTasks() {
//    let data = self.tasks.map {
//        [
//            "title": $0.title,
//            "details": $0.details,
//            "isCompleted": $0.isCompleted
//        ]
//    }
//    let userDefaults = UserDefaults.standard
//    userDefaults.set(data, forKey: "tasks")
//}
//    
//    func saveAction(_ sender: UIBarButtonItem) {
//        guard let title = titleTextField.text, !title.isEmpty,
//              let details = detailsTextField.text, !details.isEmpty else {return}
//        
//        //create a task and append to the array
//        let task = Task(title: title, details: details, isCompleted: false)
//        tasks.append(task)
//        
//        //save and dismiss the view controller
//        saveTasks()
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func cancelAction(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
//}
//}
