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
    var name : String?
    
    
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
        
// 이전 코드인데 혹시 몰라서 삭제를 안했습니다... popToRootViewController방식을 포기할 수도 있어서....!
//        guard let anotherLoginVC = self.storyboard?.instantiateViewController(withIdentifier: "UINavigationVC")as? UINavigationVC else {return}
//
//        anotherLoginVC.modalPresentationStyle = .fullScreen
//        self.present(anotherLoginVC, animated: true, completion: nil)

//
//        guard let anotherLoginVC = self.presentingViewController as? UINavigationController else { return }
//                dismiss(animated: true) {
//                    anotherLoginVC.popToRootViewController(animated: true)
//                }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Custom Method
    func setNameInLabel() {
        if let userName = name {
            nameLabel.text = userName + "님 환영합니다."
            nameLabel.sizeToFit()
        }
    }
    
    
}
