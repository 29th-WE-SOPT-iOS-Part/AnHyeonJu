//
//  LoginResponseDataModel.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/06.
//

import Foundation

// MARK: - LoginResponsData
struct LoginResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: LoginResultData? // 실패할 경우를 고려해서 옵셔널 타입
}

// MARK: - LoginResultData
struct LoginResultData: Codable {
    let id: Int
    let name, email: String
}

