//
//  ViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled=false
        
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
                
    }
    
    //push 방식(네비게이션)
    //JoinView로 이동하는 버튼 --> 회원가입
    @IBAction func touchUpToGoJoinView(_ sender: Any) {
        guard let nextVC1 = self.storyboard?.instantiateViewController(withIdentifier: "JoinViewController")
            else {return}
        //네비게이션 방식
        self.navigationController?.pushViewController(nextVC1, animated: true)
    }
    
    
    //present 방식(모달)
    //WelcomeView로 이동하는 버튼 --> 로그인 완료 & 데이터 전달
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let nextVC2 = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeVC else {return}
        
        //데이터 전달
        nextVC2.name = nameTextField.text
        nextVC2.modalPresentationStyle = .fullScreen
        self.present(nextVC2, animated: true, completion: nil)
    }
    
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if (nameTextField.text?.isEmpty == false) && (emailTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false){
            nextButton.isEnabled=true
        } else {
            nextButton.isEnabled=false
        }
    }

}
