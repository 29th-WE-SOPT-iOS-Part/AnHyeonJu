//
//  CustomTabBarViewController.swift
//  29th-week2-seminar
//
//  Created by 안현주 on 2021/10/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar(){
        guard let orangeVC = self.storyboard?.instantiateViewController(identifier: "OrangeVC"),
              let purpleVC = self.storyboard?.instantiateViewController(identifier: "PurpleVC")
        else { return }
    
        orangeVC.tabBarItem.title = "Home"
        orangeVC.tabBarItem.image = UIImage(systemName: "house")
        orangeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        purpleVC.tabBarItem.title = "Profile"
        purpleVC.tabBarItem.image = UIImage(systemName: "person")
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([orangeVC,purpleVC], animated: true)
    }
    

    
}
