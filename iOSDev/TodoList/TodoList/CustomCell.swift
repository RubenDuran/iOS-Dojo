//
//  CustomCell.swift
//  TodoList
//
//  Created by Ruben Duran on 7/16/17.
//  Copyright © 2017 RD. All rights reserved.
//

import UIKit
import CoreLocation

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var delegate: CellDelegate?
    var indexPath: NSIndexPath?
    
    override func target(forAction action: Selector, withSender sender: Any?) -> Any? {
        delegate?.check(by: self, with: 1, at: indexPath)
        print("check pressed")
        return false
    }
}
   
