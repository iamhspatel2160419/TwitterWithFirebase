//
//  ComposeViewController.swift
//  TwitterWithFirebase
//
//  Created by hp ios on 2/9/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var postBarButtonItem: UIBarButtonItem!
    
    
    @IBAction func postDidTouch(_ sender: UIBarButtonItem)
    {
        if storyTextView.text != ""
        {
            let story = Story(text: storyTextView.text)
            story.save()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = postBarButtonItem
        title = "Tell A Story"
        storyTextView.text = ""
        storyTextView.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
