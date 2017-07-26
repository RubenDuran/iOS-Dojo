//
//  AddContactVC.swift
//  ContactList
//
//  Created by Ruben Duran on 7/26/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit

class AddContactVC: UIViewController {
    
    var delegate: ContactListDelegate?
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var numberInput: UITextField!
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        print("cancel pressed")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        print("save btn pressed")
        print(firstNameInput.text!)
        print(lastNameInput.text!)
        print(numberInput.text!)
        
        if firstNameInput.text == "" || lastNameInput.text == "" || numberInput.text == "" {
            print("inputs not filled")
        } else{
            print("inputs are filled")
            delegate?.addContact(by: self, firstName: firstNameInput.text!, lastName: lastNameInput.text!, number: numberInput.text!)
            print(self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
