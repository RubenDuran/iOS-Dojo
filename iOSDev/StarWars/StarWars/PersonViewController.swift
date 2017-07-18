//
//  PersonViewController.swift
//  StarWars
//
//  Created by Ruben Duran on 7/17/17.
//  Copyright © 2017 RD. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController{
    
    var passedPerson: NSDictionary!
    

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = passedPerson["name"] as? String
        genderLabel.text = passedPerson["gender"] as? String
        birthYearLabel.text = passedPerson["birth_year"] as? String
        massLabel.text = passedPerson["mass"] as? String
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

