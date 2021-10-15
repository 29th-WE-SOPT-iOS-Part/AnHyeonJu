//
//  WelcomeViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var anotherLoginBtn: UIButton!
    
    var name : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    @IBAction func touchUpToGoTabBarView(_ sender: Any) {
        guard let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController")as? CustomTabBarController else {return}
        
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToGoAnotherLoginView(_ sender: Any) {
        guard let anotherLoginVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")as? ViewController else {return}
        
        anotherLoginVC.modalPresentationStyle = .fullScreen
        self.present(anotherLoginVC, animated: true, completion: nil)
    }
    
    
    func setNameInLabel(){
        if let userName = name {
            nameLabel.text = userName + "님"
            nameLabel.sizeToFit()
        }
    }
    
    
}
