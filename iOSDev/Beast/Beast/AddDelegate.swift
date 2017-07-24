//
//  AddDelegate.swift
//  Beast
//
//  Created by Ruben Duran on 7/24/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
protocol AddDelegate {
//    func beastBtnPressed(sender: Any?, indexPath: NSIndexPath?)
    func addBeastInput(by controller: AddItemTableViewController, with: String, date: NSDate, indexPath: NSIndexPath?)
}
