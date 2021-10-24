//
//  CustomTabBarController.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/15.
//

import UIKit

class MainTBC: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    // MARK: - Custom Method
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(identifier: "ShortsVC"),
              let plusVC = self.storyboard?.instantiateViewController(identifier: "PlusVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(identifier: "SubscribeVC"),
              let storeVC = self.storyboard?.instantiateViewController(identifier: "StoreVC")
            else { return }
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        plusVC.tabBarItem.title = "추가"
        plusVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        plusVC.tabBarItem.selectedImage = UIImage(named: "plusCircleIcon")
        
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        storeVC.tabBarItem.title = "보관함"
        storeVC.tabBarItem.image = UIImage(named: "libraryIcon")
        storeVC.tabBarItem.selectedImage = UIImage(named: "libraryIconFill")
        
        setViewControllers([homeVC, shortsVC, plusVC, subscribeVC, storeVC], animated: true)
        
    }

}
