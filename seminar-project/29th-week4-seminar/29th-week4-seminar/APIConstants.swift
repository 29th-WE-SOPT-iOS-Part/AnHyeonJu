//
//  APIConstants.swift
//  29th-week4-seminar
//
//  Created by 안현주 on 2021/10/30.
//

import Foundation

struct APIConstants {
    //MARK: - Base URL
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    //MARK: - Feature URL
    static let loginURL = baseURL + "/user/login"
    
    //GET방식을 위한 코드 추가
    static let readUserURL = baseURL + "/user/"
}
