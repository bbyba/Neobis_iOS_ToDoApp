//
//  AddViewController.swift
//  Neobis_iOS_ToDoApp
//
//  Created by Burte Bayaraa on 2023.11.02.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    struct Task{
        var title:String
        var details: String
    }
    
    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        let title = titleTextField.text
        let details = detailsTextField.text
        
        //create a new task and add to the tasks array
        var task = Task(title: "title", details: "details")
        tasks.append(task)
        
        dismiss(animated: true)
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)    //when pressing the cancel button dismisses the AddViewController
    }
}
