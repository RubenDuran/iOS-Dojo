//
//  EditContactVC.swift
//  ContactList
//
//  Created by Ruben Duran on 7/26/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit

class EditContactVC: UIViewController {
    
    
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var numberInput: UITextField!
    
    var delegate: EditDelegate?
    var indexPath: IndexPath?
    var fName: String?
    var lName: String?
    var number: String?
    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        print("save btn pressed")

        delegate?.editContact(by: self, firstName: firstNameInput.text!, lastName: lastNameInput.text!, number: numberInput.text!, indexPath: indexPath!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameInput.text = fName!
        lastNameInput.text = lName!
        numberInput.text = number!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
}
