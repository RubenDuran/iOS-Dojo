//
//  FilmDescriptionController.swift
//  StarWars
//
//  Created by Ruben Duran on 7/17/17.
//  Copyright © 2017 RD. All rights reserved.
//

import UIKit

class FilmDescriptionController: UIViewController{
    
    var passedFilm: NSDictionary!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var crawlLabel: UILabel!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        nameLabel.text = passedPerson["name"] as? String
        titleLabel.text = passedFilm["title"] as? String
        dateLabel.text = passedFilm["release_date"] as? String
        directorLabel.text = passedFilm["director"] as? String
        crawlLabel.text = passedFilm["opening_crawl"] as? String

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
