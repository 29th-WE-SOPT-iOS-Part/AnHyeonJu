//
//  ViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class LoginVC: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
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
    @IBAction func touchUpToGoSignUpView(_ sender: Any) {
        guard let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") else {return}
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    @IBAction func touchUpToGoWelcomeView(_ sender: Any) {
        requestLogin()
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
        [nameTextField, emailTextField, passwordTextField].forEach{
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
    }
    
}

// MARK: - Extension
extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//🌱UserDeFaults 사용
extension LoginVC {
    func requestLogin() {
        UserLoginService.shared.login(email: emailTextField.text ?? "",
                                      password: passwordTextField.text ?? "") { [self] responseData in
            switch  responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if response.data != nil {
                    UserDefaults.standard.set(self.nameTextField.text, forKey: "name")
                    self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
                        welcomeVC.modalPresentationStyle = .fullScreen
                        self.present(welcomeVC, animated: true, completion: nil)
                    })
                }
            case .requestErr(let loginResponse):
                print("requestERR \(loginResponse)")
                guard let response = loginResponse as? LoginResponseData else { return }
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    setTextFieldEmpty()
                })
            case .pathErr(let loginResponse):
                print("pathErr")
                guard let response = loginResponse as? LoginResponseData else { return }
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    self.setTextFieldEmpty()
                })
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
