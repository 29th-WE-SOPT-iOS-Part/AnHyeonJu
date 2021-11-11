//
//  UserDefaults + Extension.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/11.
//

import Foundation
import UIKit

extension UserDefaults {
    // UserDefaults key value가 많아지면 관리하기 어려워지므로 enum 'Keys'로 묶어 관리
    enum Keys {
        static var loginUserName = "loginUserName"
    }
}
