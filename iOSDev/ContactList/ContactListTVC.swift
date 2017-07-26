//
//  ContactListTVC.swift
//  ContactList
//
//  Created by Ruben Duran on 7/26/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ContactListTVC: UITableViewController, ContactListDelegate, EditDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var contacts = [ContactList]()
    
    
    @IBAction func addContactBtn(_ sender: UIBarButtonItem) {
        print("add pressed")
        performSegue(withIdentifier: "AddSegue", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
//        let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
        
        let viewButton = UIAlertAction(title: "View", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.performSegue(withIdentifier: "ShowSegue", sender: indexPath)
        })
        
        let editButton = UIAlertAction(title: "Edit", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            self.performSegue(withIdentifier: "EditSegue", sender: indexPath)
        })
        
        let  deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            print("Delete button tapped")
            let contact = self.contacts[indexPath.row]
            print(contact)
            self.context.delete(contact)
            do {
                try self.context.save()
            } catch {
                print("\(error)")
            }
            self.fetchAllItems()
            tableView.reloadData()

        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(viewButton)
        alertController.addAction(editButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.navigationController!.present(alertController, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
//        cell.delegate = self
//        cell.indexPath = indexPath as NSIndexPath
        let name = contacts[indexPath.row].firstName! + " " + contacts[indexPath.row].lastName!
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = contacts[indexPath.row].phone
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if sender is UIBarButtonItem{
            print("sender is uiBtn")
            let navigationController = segue.destination as! UINavigationController
            let destination = navigationController.topViewController as! AddContactVC
            destination.delegate = self
        }
        if sender is NSIndexPath {
            
            if segue.identifier == "ShowSegue" {
                let navigationController = segue.destination as! UINavigationController
                let destination = navigationController.topViewController as! ContactDetailVC
                let iP = sender as! NSIndexPath!
                print(iP!.row)
                let contact = contacts[iP!.row]
                print("the contact")
                print(contact)
                destination.title = contact.firstName
                destination.name = contact.firstName! + " " + contact.lastName!
                destination.number = contact.phone

            }
            
            if segue.identifier == "EditSegue"{
                let navigationController = segue.destination as! UINavigationController
                let destination = navigationController.topViewController as! EditContactVC
                destination.delegate = self
                let iP = sender as! NSIndexPath!
                print(iP!.row)
                let contact = contacts[iP!.row]
                print("the contact")
                print(contact)
                destination.fName = contact.firstName!
                destination.lName = contact.lastName!
                destination.number = contact.phone
                destination.indexPath = iP! as IndexPath
            }
            
        }

    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "ContactList")
               do{
            let result = try context.fetch(request)
            contacts = result as! [ContactList]
        } catch{
            print("error ***** - \(error)")
            
        }
    }
    
    func addContact(by controller: AddContactVC, firstName: String, lastName: String, number: String){
        print("back in TVC")
        let contact = NSEntityDescription.insertNewObject(forEntityName: "ContactList", into: context) as! ContactList
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phone = number
        
       do {
       try context.save()
       print("thhe contexxt \(context)")
       print("saved!!!!")
       } catch {
       print("errors ==== \(error)")
     }
      dismiss(animated: true, completion: nil)
      fetchAllItems()
      tableView.reloadData()
        
    }
    
    func editContact(by controller: EditContactVC, firstName: String, lastName: String, number: String, indexPath: IndexPath){
        print("back in TVC")
        let contact = contacts[indexPath.row]
        contact.firstName = firstName
        contact.lastName = lastName
        contact.phone = number
        
        do {
            try context.save()
            print("thhe contexxt \(context)")
            print("saved!!!!")
        } catch {
            print("errors ==== \(error)")
        }
        dismiss(animated: true, completion: nil)
        fetchAllItems()
        tableView.reloadData()

    }
}
