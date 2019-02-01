//
//  AppDelegate.swift
//  Quizzes
//
//  Created by Alex Paul on 1/31/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let quizVC = QuizViewController()
    quizVC.tabBarItem = UITabBarItem(title: "Quizes", image: UIImage(named: "quiz-icon"), tag: 0)
    let quizNav = UINavigationController.init(rootViewController: quizVC)
    
    let searchVC = SearchViewController()
    searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 1)


    
    let createVC = CreateViewController()
    createVC.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "create-icon"), tag: 2)

    let profileVC = ProfileViewController()
    profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-unfilled"), tag: 3)
    
    
    //this is for protocol to work so that the settings view controller can change the best viewcontroller without persistence. includes protocol code on settings and extension on best
//    setVC.delegate = bestVC
    
    let tab = UITabBarController()
    tab.viewControllers = [quizNav,searchVC,createVC,profileVC]
    
    
    
    window = UIWindow.init(frame: UIScreen.main.bounds)
    window?.rootViewController = tab
    window?.makeKeyAndVisible()
    
    
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

