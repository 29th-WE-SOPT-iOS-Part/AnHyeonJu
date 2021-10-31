//
//  NetworkResult.swift
//  29th-week4-seminar
//
//  Created by 안현주 on 2021/10/30.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
