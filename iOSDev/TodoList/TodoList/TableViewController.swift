//
//  TableViewController.swift
//  TodoList
//
//  Created by Ruben Duran on 7/15/17.
//  Copyright © 2017 RD. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController, CellDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var items = [TodoList] ()
    
    
    func fetchAllItems() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoList")
        do {
            let result = try managedObjectContext.fetch(request)
            items = result as! [TodoList]
        } catch{
            print("error ***** - \(error)")
        }
    }
    
        func updateCompleted(by controller: TableViewController, with text: String, at indexPath: NSIndexPath?) {
            if let ip = indexPath{
                let item = items[ip.row]
                if item.completed == true{
                    item.completed = false
                }else{
                    item.completed = true
                }
                
                } else{
                    print("no go")
                }
            
                do {
                    try managedObjectContext.save()
                } catch {
                    print("\(error)")
                }
            
            tableView.reloadData()
        }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.delegate = self
        cell.titleLabel?.text = items[indexPath.row].title
        cell.descriptionLabel?.text = items[indexPath.row].desc
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.short
        let strDate = dateFormatter.string(from: items[indexPath.row].date! as Date)
        cell.dateLabel.text = strDate
        //String(describing: items[indexPath.row].date! as Date)
//        cell.dateLabel?.text = items[indexPath.row].date as! String
        
        if items[indexPath.row].completed == false{
            cell.checkLabel?.isHidden = true
        } else {
            cell.checkLabel?.isHidden = false
        }
        
        return cell
        
    }
    
    func check(by controller: CustomCell, with int: Int , at indexPath: NSIndexPath?){
        print("in chk function")
        updateCompleted(by: self, with: "chk", at: indexPath)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        check(by: cell, with: indexPath.row, at: indexPath as NSIndexPath)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllItems()
        for item in items{
            print(item.title!)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchAllItems()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
