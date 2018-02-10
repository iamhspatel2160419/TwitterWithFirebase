//
//  AppDelegate.swift
//  TwitterWithFirebase
//
//  Created by hp ios on 2/9/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        
        
        return true
    }

   

}

