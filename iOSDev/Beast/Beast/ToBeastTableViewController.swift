//
//  ToBeastTableViewController.swift
//  Beast
//
//  Created by Ruben Duran on 7/24/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ToBeastTableViewController: UITableViewController, BeastCellDelegate, AddDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddEditSegue", sender: sender)
    }
    var toBeast = [Beast]()
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return toBeast.count
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let delete = UITableViewRowAction(style: .destructive, title: "delete") {
            action, index in
            print("delete ")
            let beast = self.toBeast[indexPath.row]
            print(beast)
            self.context.delete(beast)
            do {
                try self.context.save()
            } catch {
                print("\(error)")
            }
            self.fetchAllUnbeastedItems()
            tableView.reloadData()
            
        }
        return [delete]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "AddEditSegue", sender: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeastCell", for: indexPath) as! BeastCell
        
        cell.delegate = self
        cell.toBeastLabel.text = toBeast[indexPath.row].content
        
            cell.indexPath = indexPath as NSIndexPath
            return cell
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if sender is UIBarButtonItem{
            print("sender is uiBtn")
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTableViewController.delegate = self
        }
        if sender is NSIndexPath {
            let navigationController = segue.destination as! UINavigationController
            let editItemTableViewController = navigationController.topViewController as! AddItemTableViewController
            editItemTableViewController.delegate = self
            
            let iP = sender as! NSIndexPath!
            print(iP!.row)
            let beast = toBeast[iP!.row]
            print("the beast item")
            print(beast)
            editItemTableViewController.editInput = beast.content
            editItemTableViewController.indexPath = iP!
        }
    }
    
    func fetchAllUnbeastedItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Beast")
        request.predicate = NSPredicate(format: "beasted == %@", NSNumber(value: false))
        do{
            let result = try context.fetch(request)
            toBeast = result as! [Beast]
//            print(beast)
        } catch{
            print("error ***** - \(error)")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllUnbeastedItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBeastInput(by controller: AddItemTableViewController, with: String, date: NSDate, indexPath: NSIndexPath?){
        print("back in the controller")
        if let ip = indexPath{
                        print(ip)
                        if with == ""{
                            print("nothing to do")
                        } else{
                            let beast = toBeast[indexPath!.row]
                            beast.content = with
                            beast.beastedDate = date
                            beast.beasted = false
                        }
                    }else{
                        if with == ""{
                            print("nothing to do")
                        } else{
                            let newBeast = NSEntityDescription.insertNewObject(forEntityName: "Beast", into: context) as! Beast
                            newBeast.content = with
                            newBeast.beastedDate = date
                            newBeast.beasted = false
                        }
                    }
                    do {
                        try context.save()
                        print("thhe contexxt \(context)")
                        print("saved!!!!")
                    } catch {
                        print("errors ==== \(error)")
                    }
        
            dismiss(animated: true, completion: nil)
            fetchAllUnbeastedItems()
            tableView.reloadData()

    }
    
    func beastBtnPressed(by: BeastCell, indexPath: NSIndexPath){
        print("back in table view")
        let beast = toBeast[indexPath.row]
        beast.beasted = true
        do {
            try context.save()
            print("thhe contexxt \(context)")
            print("saved!!!!")
        } catch {
            print("errors ==== \(error)")
        }

        fetchAllUnbeastedItems()
        tableView.reloadData()

    }
    
}
