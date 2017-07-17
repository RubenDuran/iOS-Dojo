//
//  cellDelagate.swift
//  TodoList
//
//  Created by Ruben Duran on 7/16/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit

protocol CellDelegate {
    func check(by controller: CustomCell, with int: Int , at indexPath: NSIndexPath?)
//    func subtract(by controller: CustomCell, with int: Int , at indexPath: NSIndexPath?)
}

