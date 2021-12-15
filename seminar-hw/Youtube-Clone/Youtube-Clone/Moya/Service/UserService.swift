//
//  UserService.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/12/11.
//

import Foundation


protocol UserSerViceType {
  
  func postLogin(email: String, password: String, completion : @escaping (Result<LoginDataModel?, Error>) -> Void)
  func postSignUp(email: String,name: String,password: String, completion : @escaping (Result<[SignUpDataModel]?, Error>) -> Void)
    
}

extension BaseService : UserSerViceType{
    func postLogin(email: String, password: String, completion : @escaping (Result<LoginDataModel?, Error>) -> Void){
        requestObject(.postLogin(email: email, password: password),completion: completion)
    }
    func postSignUp(email: String, name: String,password: String, completion : @escaping (Result<[SignUpDataModel]?, Error>) -> Void){
        requestObject(.postSignUp(email: email, name: name, password: password), completion: completion)
    }
}
