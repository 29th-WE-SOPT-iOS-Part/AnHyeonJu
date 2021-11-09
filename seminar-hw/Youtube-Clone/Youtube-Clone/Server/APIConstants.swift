//
//  APIConstants.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/05.
//

import Foundation

struct APIConstants {
    //MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: - Feature URL(Login)
    static let loginURL = baseURL + "/user/login"
    
    //MARK: - Feature URL(SignUp)
    static let signupURL = baseURL + "/user/signup"
    
    //MARK: - Feature URL(Login)
    static let readUserURL = baseURL + "/user/"
}
