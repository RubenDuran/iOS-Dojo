//
//  ContactListDelegate.swift
//  ContactList
//
//  Created by Ruben Duran on 7/26/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
protocol ContactListDelegate {
    func addContact(by controller: AddContactVC, firstName: String, lastName: String, number: String)
}
