//
//  SignUpResponseDataModel.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/09.
//

import Foundation

// MARK: - SignUpResponsData
struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpResultData? // 실패할 경우를 고려해서 옵셔널 타입
}

// MARK: - SignUpResultData
struct SignUpResultData: Codable {
    let id: Int
    let name,email: String
//    let password: Int
}

