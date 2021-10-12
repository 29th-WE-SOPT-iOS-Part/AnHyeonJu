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
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        setTextField()
    }
    
    //push 방식(네비게이션)
    //JoinView로 이동하는 버튼 --> 회원가입
    @IBAction func touchUpToGoJoinView(_ sender: Any) {
        guard let joinVC = self.storyboard?.instantiateViewController(withIdentifier: "JoinVC")
            else {return}
        //네비게이션 방식
        self.navigationController?.pushViewController(joinVC, animated: true)
    }
    
    
    //present 방식(모달)
    //WelcomeView로 이동하는 버튼 --> 로그인 완료 & 데이터 전달
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
        
        //데이터 전달
        welcomeVC.name = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
    }
    
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if (nameTextField.hasText) && (emailTextField.hasText) && (passwordTextField.hasText){
                nextBtn.isEnabled = true
            } else {
                nextBtn.isEnabled = false
            }
    }
    
    func setTextField() {
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }



}
