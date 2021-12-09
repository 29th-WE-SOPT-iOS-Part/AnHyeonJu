//
//  LoginRequest.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/12/10.
//

import Foundation

struct LoginRequest: Codable {
    var email: String
    var password: String
    
    init(_ email: String, _ password: String) {
        self.email = email
        self.password = password
    }
}
