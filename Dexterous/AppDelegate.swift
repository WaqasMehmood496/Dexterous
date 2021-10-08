//
//  AppDelegate.swift
//  Dexterous
//
//  Created by Buzzware Tech on 13/09/2021.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        checkUserLoginStatus()
        return true
    }    
}


extension AppDelegate {
    func checkUserLoginStatus() {
        var storyboard :UIStoryboard!
        if UIDevice.current.userInterfaceIdiom == .phone{
            storyboard = UIStoryboard(name: "Main", bundle: nil)
        } else {
            storyboard = UIStoryboard(name: "Ipad", bundle: nil)
        }
        if (CommonHelper.getCachedUserData()?.email != nil){
            let controller = storyboard.instantiateViewController(identifier: "TabbarController")
            self.window?.rootViewController = controller
        } else {
            let controller = storyboard.instantiateViewController(identifier: "StartUpController")
            self.window?.rootViewController = controller
        }
        self.window?.makeKeyAndVisible()
    }
}
