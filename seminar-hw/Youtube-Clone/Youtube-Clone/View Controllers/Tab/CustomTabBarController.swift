//
//  CustomTabBarController.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/15.
//

import UIKit

class CustomTabBarController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
    }
    
    // MARK: - Custom Method
    func setTabBar(){
        guard let orangeVC = self.storyboard?.instantiateViewController(identifier: "OrangeVC"),
              let purpleVC = self.storyboard?.instantiateViewController(identifier: "PurpleVC"),
              let yellowVC = self.storyboard?.instantiateViewController(identifier: "YellowVC"),
              let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC"),
              let pinkVC = self.storyboard?.instantiateViewController(identifier: "PinkVC")
            else { return }
        
        orangeVC.tabBarItem.title = "홈"
        orangeVC.tabBarItem.image = UIImage(named: "homeIcon")
        orangeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        purpleVC.tabBarItem.title = "Shorts"
        purpleVC.tabBarItem.image = UIImage(named: "shortsIcon")
        purpleVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        yellowVC.tabBarItem.title = "추가"
        yellowVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        yellowVC.tabBarItem.selectedImage = UIImage(named: "plusCircleIcon")
        
        greenVC.tabBarItem.title = "구독"
        greenVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        greenVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        pinkVC.tabBarItem.title = "보관함"
        pinkVC.tabBarItem.image = UIImage(named: "libraryIcon")
        pinkVC.tabBarItem.selectedImage = UIImage(named: "libraryIconFill")
        
        setViewControllers([orangeVC, purpleVC, yellowVC, greenVC, pinkVC], animated: true)
        
    }

}
