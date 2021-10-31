//
//  LoginRequestDataModel.swift
//  29th-week4-seminar
//
//  Created by 안현주 on 2021/10/30.
//

import Foundation

// MARK: - LoginResponsData
struct LoginResponsData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData?
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}
