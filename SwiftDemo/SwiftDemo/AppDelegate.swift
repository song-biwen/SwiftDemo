//
//  AppDelegate.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/16.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = UTabBarController.init()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }

}

