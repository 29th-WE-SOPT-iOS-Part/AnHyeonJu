//
//  JoinViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit
import Moya

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
        postSignUpService()
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
    
    func goToWelcomeVC(){
        UserDefaults.standard.set(self.nameTextField.text, forKey: UserDefaults.Keys.loginUserName)
        self.makeAlert(title: "로그인", message: "로그인 실패", okAction: { _ in
            guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC") as? WelcomeVC else {return}
            
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: true, completion: {
                self.navigationController?.popToRootViewController(animated: true)
            })
        })
    }
                       
                       
    func postSignUpService(){
        BaseService.default.postSignUp(email: emailTextField.text!, name: nameTextField.text!, password: passwordTextField.text! ){ result in
            result.success { list in
                self.goToWelcomeVC()
                
            }.catch{ error in
                print("review Err")
                if let err = error as? MoyaError{
                  dump(err)
                }
                print("엥? ")
                dump(error)
            }
        }
    }
    
}

//// MARK: - Extension
//extension SignUpVC {
//    func requestSignUp() {
//        UserSignUpService.shared.signUp(email: emailTextField.text ?? "",
//                                        name: nameTextField.text ?? "",
//                                     password: passwordTextField.text ?? "") { responseData in
//            switch  responseData {
//            case .success(let signupResponse):
//                guard let response = signupResponse as? SignUpResponseData else { return }
//                if response.data != nil {
//                    UserDefaults.standard.set(self.nameTextField.text, forKey: UserDefaults.Keys.loginUserName)
//                    self.makeAlert(title: "회원가입", message: response.message, okAction: { _ in
//                        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeVC")as? WelcomeVC else {return}
//                        welcomeVC.modalPresentationStyle = .fullScreen
//                        self.present(welcomeVC, animated: true, completion: {
//                            self.navigationController?.popToRootViewController(animated: true)
//                        })
//                    })
//                }
//            case .requestErr(let signupResponse):
//                print("requestERR \(signupResponse)")
//                guard let response = signupResponse as? SignUpResponseData else { return }
//                self.makeAlert(title: "회원가입", message: response.message ,okAction: { _ in
//                    self.setTextFieldEmpty()
//                })
//            case .pathErr(let signupResponse):
//                print("pathErr")
//                guard let response = signupResponse as? SignUpResponseData else { return }
//                self.makeAlert(title: "회원가입", message: response.message, okAction: { _ in
//                    self.setTextFieldEmpty()
//                })
//            case .serverErr:
//                print("serverErr")
//            case .networkFail:
//                print("networkFail")
//            }
//        }
//    }
//}
