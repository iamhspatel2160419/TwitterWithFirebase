//
//  WelcomeViewController.swift
//  UITableViewDemo
//


//

import UIKit
import Firebase

class WelcomeViewController: UIViewController
{
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
    }
   
    
    @IBAction func loginDidTouch(sender: AnyObject)
    {
        (sender as! UIButton).alpha = 1.0
        Auth.auth().signInAnonymously {
            (FirebaseUser, Error) in
            if Error == nil
            {
                self.performSegue(withIdentifier: "Show Stories", sender: nil)
            }
            else
            {
                print(Error?.localizedDescription ?? "")
            }
            
        }
    }
    
    @IBAction func loginTouchDown(sender: AnyObject)
    {
        (sender as! UIButton).alpha = 0.8
    }
}
