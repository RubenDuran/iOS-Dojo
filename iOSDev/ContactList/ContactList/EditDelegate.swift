//
//  EditDelegate.swift
//  ContactList
//
//  Created by Ruben Duran on 7/26/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
protocol EditDelegate {
    func editContact(by controller: EditContactVC, firstName: String, lastName: String, number: String, indexPath: IndexPath)
}
