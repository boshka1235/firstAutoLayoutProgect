//
//  AppDelegate.swift
//  firstAutoLayoutProgect
//
//  Created by Oatmeal Simon on 10/23/21.
//  Copyright © 2021 Oatmeal Simon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        
        let mainNavigationController = MainNavigationController()
        let layoutController = LayoutController()
        
        mainNavigationController.viewControllers = [layoutController]

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = mainNavigationController
        
        return true
    }

}

