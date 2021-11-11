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
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))

        shortsVC.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))

        plusVC.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plusCircleIcon"), selectedImage: UIImage(named: "plusCircleIcon"))
        
        subscribeVC.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        
        storeVC.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "libraryIcon"), selectedImage: UIImage(named: "libraryIconFill"))
        
        
        setViewControllers([homeVC, shortsVC, plusVC, subscribeVC, storeVC], animated: true)
        
    }

}
