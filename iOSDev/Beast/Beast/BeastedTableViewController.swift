//
//  BeastedTableViewController.swift
//  Beast
//
//  Created by Ruben Duran on 7/24/17.
//  Copyright © 2017 RD. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class BeastedTableViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var beasted = [Beast]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllBeastedItems()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchAllBeastedItems()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchAllBeastedItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Beast")
        request.predicate = NSPredicate(format: "beasted == %@", NSNumber(value: true))
        do{
            let result = try context.fetch(request)
            beasted = result as! [Beast]
        } catch{
            print("error ***** - \(error)")
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beasted.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeastedCell", for: indexPath)
//        cell.delegate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.string(from: beasted[indexPath.row].beastedDate! as Date)
        cell.detailTextLabel?.text = strDate
        cell.textLabel?.text = beasted[indexPath.row].content
        return cell
    }
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let delete = UITableViewRowAction(style: .destructive, title: "delete") {
            action, index in
            print("delete ")
            let beast = self.beasted[indexPath.row]
            print(beast)
            self.context.delete(beast)
            do {
                try self.context.save()
            } catch {
                print("\(error)")
            }
            self.fetchAllBeastedItems()
            tableView.reloadData()
            
        }
        return [delete]
    }
}
