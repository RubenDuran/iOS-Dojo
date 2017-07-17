//
//  ViewController.swift
//  StarWars
//
//  Created by Ruben Duran on 7/17/17.
//  Copyright © 2017 RD. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {
    
     var people = [String] ()
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // if we return - sections we won't have any sections to put our rows in
//        return 1
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        print("in row count function \(people.count)")
        return people.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://swapi.co/api/people/")
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        // create a "data task" to make the request and run the completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
//                    print(jsonResult)
                    if let results = jsonResult["results"] {
//                        print(results)
                        let resultsArray = results as! NSArray
                        // now we can run NSArray methods like count and firstObject
                        print("the count --- \(resultsArray.count)")
                        print("at 0 ---- \(resultsArray[0])")
                        print("the first obj ==== \(resultsArray.firstObject!)")
                        for person in resultsArray{
                            let p = person as! NSDictionary
                            print(p["name"]!)
                            self.people.append(p["name"]! as! String)
                        }
                        print(self.people)
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print(error)
            }
        })
        // execute the task and wait for the response before
        // running the completion handler. This is async!
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

