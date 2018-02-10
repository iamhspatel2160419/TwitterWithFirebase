//
//  StoriesTableViewController.swift
//  TwitterWithFirebase
//
//  Created by hp ios on 2/9/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit
import Firebase
class StoriesTableViewController: UITableViewController {

    @IBOutlet weak var composeBarButtonItem: UIBarButtonItem!
    
    let storiesRef = Database.database().reference().child("stories")
    var stories = [Story]()
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        storiesRef.observe(.value)
        {
            (snapshot) in
            self.stories.removeAll()
       
            for child in snapshot.children
            {
                let storySnapShot = child as! DataSnapshot
                let story = Story(snapshot: storySnapShot)
                self.stories.insert(story, at: 0)
                
            }
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        title = "Stories"
        self.navigationItem.rightBarButtonItem = composeBarButtonItem
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Story Cell", for: indexPath) as! StoryTableViewCell
        cell.story = stories[indexPath.row]
        return cell
        
    }

 
}
