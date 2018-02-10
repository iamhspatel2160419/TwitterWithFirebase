//
//  StoryTableViewCell.swift
//  UITableViewDemo
//
//  Created by Duc Tran on 2/24/16.
//  Copyright © 2016 Developers Academy. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell
{
    private let likeColor = UIColor(red: 243.0/255.0, green: 62.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    private let angryColor = UIColor(red: 155/255.0, green: 53/255.0, blue: 181/255.0, alpha: 1.0)
    
    var story: Story! {
        didSet {
            // Configure this cell here
            updateUI()
        }
    }
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var angryButton: UIButton!
    
    private func updateUI()
    {
        storyLabel.text = story.text
        likeButton.setTitle("😍\(story.numberOfLikes)", for: [])
        angryButton.setTitle("👿\(story.numberOfAngry)", for: [])
    }
    
    @IBAction func angreeDidTouch(_ sender: Any) {
        
    }
   

    @IBAction func likeDidTouch(_ sender: Any) {
        story.Like()
        likeButton.setTitle("😍\(story.numberOfLikes)", for: [])
        likeButton.setTitleColor(likeColor, for: [])
    }
   
}
