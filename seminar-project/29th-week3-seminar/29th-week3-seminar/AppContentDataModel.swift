//
//  AppContentDataModel.swift
//  29th-week3-seminar
//
//  Created by 안현주 on 2021/10/23.
//

import UIKit

struct AppContentData {
    let appName: String
    let description: String
    let appIconName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
