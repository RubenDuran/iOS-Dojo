//
//  ViewController.swift
//  TodoList
//
//  Created by Ruben Duran on 7/12/17.
//  Copyright © 2017 RD. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [TodoList] ()
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    @IBAction func addTodoButton(_ sender: UIButton) {
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "TodoList", into: managedObjectContext) as! TodoList
        item.date = dateField.date as NSDate
        item.completed = false
        item.title = (titleTextField.text! as NSString) as String
        item.desc = (descriptionTextField.text! as NSString) as String
        
        do {
            try managedObjectContext.save()
            print(managedObjectContext)
            print("saved!!!!")
        } catch {
            print("errors ==== \(error)")
            
        }
        
        titleTextField.text = ""
        descriptionTextField.text = ""
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

