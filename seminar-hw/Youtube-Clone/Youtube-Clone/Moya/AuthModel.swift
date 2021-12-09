//
//  AuthModel.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/12/10.
//

import Foundation

struct AuthModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: AuthData?
}

// MARK: - AuthInfo

struct AuthData: Codable {
    let id: Int
    let name, email: String
}
