//
//  SignUpRequest.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/12/10.
//

import Foundation

// MARK: - Welcome
struct SignUpRequest: Codable {
    var email: String
    var name: String
    var password: String
    
    init(_ email: String, _ name: String ,_ password: String) {
        self.email = email
        self.name = name
        self.password = password
    }
}
