//
//  AppDelegate.swift
//  whooooo
//
//  Created by Uladzislau Volchyk on 7/31/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    var coordinator: Coordinator?
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
//        Auth.auth().updateCurrentUser(<#T##user: User##User#>, completion: <#T##UserUpdateCallback?##UserUpdateCallback?##(Error?) -> Void#>)
//        try! Auth.auth().signOut()
        UserDefaults.standard.removeObject(forKey: "authVerificationID")
        let navigationController = UINavigationController()
        self.coordinator = AppCoordinator(navigationController: navigationController)
        
        self.coordinator?.start()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

