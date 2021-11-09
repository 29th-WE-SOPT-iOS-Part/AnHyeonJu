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
        getUserData()
        
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
    
    //성공일 경우 alert 함수
    func successAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default,  handler: { (action) in
            guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
            
            welcomeVC.name = self.nameTextField.text
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: true, completion: nil)
        })
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    //실패시 alert 함수
    func failAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
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

extension LoginVC {
    func requestLogin() { //statuscode가 200이였다면 담아져 있는 개체는 LoginResponseData지만 실살 Any타입이라 형변환을 해야한다.
        UserLoginService.shared.login(email: emailTextField.text ?? "",
                                     password: passwordTextField.text ?? "") { responseData in
            switch  responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if response.data != nil {
                    self.successAlert(title: "로그인", message: response.message)
                }
                
            case .requestErr(let msg):
                print("requestERR \(msg)")
                
            case .pathErr(let loginResponse):
                print("pathErr")
                guard let response = loginResponse as? LoginResponseData else { return }
                self.failAlert(title: "로그인", message: response.message)
                
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getUserData() {
        UserLoginService.shared.readUserData(userId: 2) { responseData in
            switch  responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                //WelcomeVC 선언
                guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
                if let userData = response.data { //이름바꾸기 WelcomeVC
                    welcomeVC.name = userData.name
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
