//
//  WelcomeViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class WelcomeVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var anotherLoginBtn: UIButton!
//    var name : String?
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    
    // MARK: - @IBAction
    @IBAction func touchUpToGoTabBarView(_ sender: Any) {
        let tabbar = UIStoryboard.init(name: "Tabbar", bundle: nil)
        guard let tabBarController = tabbar.instantiateViewController(withIdentifier: "MainTBC")as? MainTBC else {return}
        
        tabBarController.modalPresentationStyle = .fullScreen
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToGoAnotherLoginView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //🌱UserDefaults사용! --> 이전에 있전 setText관련 코드 삭제
    // MARK: - Custom Method
    func setNameInLabel() {
        if let user = UserDefaults.standard.string(forKey: UserDefaults.Keys.loginUserName) {
            nameLabel.text = "\(user)님 환영합니다!"
            nameLabel.sizeToFit()
        }
    }
    
    
}
