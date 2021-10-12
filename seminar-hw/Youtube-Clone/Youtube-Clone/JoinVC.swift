//
//  JoinViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class JoinVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        
        setTextField()
    }
    
    
    //비밀번호 표시 버튼
    @IBAction func didTapViewPassword(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            showPasswordBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            showPasswordBtn.setImage(UIImage(systemName: "square"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    

    //present 방식(모달)
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC")as? WelcomeVC else {return}

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
