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
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!

    struct Task{
        var title:String
        var details: String
    }
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty,                  //unwraps the values for the title and details, and checks if they are empty
                let details = detailsTextField.text, !details.isEmpty else {
                return
            }
        
        //create a new task and add to the tasks array
        let task = Task(title: title, details: details)     //unchangeable reference to the object, but changeable properties
        tasks.append(task)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
