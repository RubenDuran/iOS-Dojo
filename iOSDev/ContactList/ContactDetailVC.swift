//
//  ContactDetailVC.swift
//  ContactList
//
//  Created by Ruben Duran on 7/26/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit

class ContactDetailVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var name: String?
    var number: String?
    
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name!
        numberLabel.text = number!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
