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
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled=false
        
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.emailTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
        self.passwordTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)

    }
    
    
    //비밀번호 표시 버튼
    @IBAction func didTapViewPassword(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    //present 방식(모달)
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let nextVC3 = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController")as? WelcomeVC else {return}
        
        //데이터 전달
        nextVC3.name = nameTextField.text
        nextVC3.modalPresentationStyle = .fullScreen
        self.present(nextVC3, animated: true, completion: nil)
    }
    
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        if (nameTextField.text?.isEmpty == false) && (emailTextField.text?.isEmpty == false) && (passwordTextField.text?.isEmpty == false){
            nextButton.isEnabled=true
        } else {
            nextButton.isEnabled=false
        }
    }

}
