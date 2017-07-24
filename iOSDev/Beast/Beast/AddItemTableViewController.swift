//
//  addItemTableViewController.swift
//  Beast
//
//  Created by Ruben Duran on 7/24/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class AddItemTableViewController: UITableViewController {
    
    
//    var delegate: ToBeastTableViewController?
//    var addDelegate: AddDelegate?
    var delegate: AddDelegate?
    var editInput: String?
    var date: NSDate?
    var indexPath: NSIndexPath?
    
    
    @IBOutlet weak var addInput: UITextField!

    
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        print("cancel pressed")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        print("done pressed")
        date = Date() as NSDate
        
        delegate?.addBeastInput(by: self, with: addInput.text!, date:date!, indexPath: indexPath);
        print(addInput.text!)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addInput.text = editInput

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
