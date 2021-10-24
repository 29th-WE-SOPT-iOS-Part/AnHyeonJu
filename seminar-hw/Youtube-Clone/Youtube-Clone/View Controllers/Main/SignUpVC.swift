//
//  JoinViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class SignUpVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isEnabled = false
        setTextField()
        hideKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            setTextFieldEmpty()
    }
    
    
    // MARK: - @IBAction
    @IBAction func didTapViewPassword(_ sender: UIButton) {
        if passwordTextField.isSecureTextEntry {
            showPasswordBtn.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            showPasswordBtn.setImage(UIImage(systemName: "square"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC")as? WelcomeVC else {return}
        
        welcomeVC.name = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        
        //샤라웃 투 지은님... 감사합니다...
        self.present(welcomeVC, animated: true, completion: {
            //confirmVC로 modal present와 동시에 navigation stack에서 signUpVC를 pop해줘서 rootVC로 돌아가게끔 해줍니다. (popViewController, popToRootViewController 모두 가능)
            self.navigationController?.popToRootViewController(animated: true)
        })
    }
    
    
    // MARK: - Custom Method
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextBtn.isEnabled = nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText
    }
    
    func setTextFieldEmpty() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0.text = ""
        }
    }
    
    func setTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
}



