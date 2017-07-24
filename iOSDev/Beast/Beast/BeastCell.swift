//
//  BeastCell.swift
//  Beast
//
//  Created by Ruben Duran on 7/24/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class BeastCell: UITableViewCell {
    
    @IBOutlet weak var toBeastLabel: UILabel!
    
    var delegate: BeastCellDelegate?
    var indexPath: NSIndexPath?
    
    @IBAction func beastBtn(_ sender: UIButton) {
        print("Beast btn pressed")
        print(self)
        delegate?.beastBtnPressed(by: self, indexPath: indexPath!)
        
    }

}
