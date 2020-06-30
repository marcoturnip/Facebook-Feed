//
//  CustomTabBarController.swift
//  Facebook Feed
//
//  Created by Marco G. Turnip on 16/03/20.
//  Copyright © 2020 MGT. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "Home"
        navigationController.tabBarItem.image = UIImage(named: "home_icon")
        
        let friendRequestsController = FriendsController()
        let friendNavigationController = UINavigationController(rootViewController: friendRequestsController)
        friendNavigationController.title = "Friends"
        friendNavigationController.tabBarItem.image = UIImage(named: "friends_icon")
        
        let messengerVC = UIViewController()
        messengerVC.navigationItem.title = "Messenger Chat"
        let messengerNavigationControler =  UINavigationController(rootViewController: messengerVC)
        messengerNavigationControler.title = "Messenger"
        messengerNavigationControler.tabBarItem.image = UIImage(named: "messenger_icon")
        
        let notificationBell = UIViewController()
        notificationBell.navigationItem.title = "All Notification"
        let notificationNavigationContoller = UINavigationController(rootViewController: notificationBell)
        notificationNavigationContoller.title = "Notification"
        notificationNavigationContoller.tabBarItem.image = UIImage(named: "notification_icon")
        
        let moreInfo = UIViewController()
        moreInfo.navigationItem.title = "Setting"
        let moreNavigationController = UINavigationController(rootViewController: moreInfo)
        moreNavigationController.title = "More"
        moreNavigationController.tabBarItem.image = UIImage(named: "more_icon")
//        multi tab bar
        viewControllers = [navigationController, friendNavigationController, messengerNavigationControler, notificationNavigationContoller, moreNavigationController]
        
        tabBar.isTranslucent = false
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = false
    }
}
