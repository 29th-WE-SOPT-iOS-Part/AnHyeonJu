//
//  homeDataModel.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/28.
//

import UIKit

struct HomeContentData {
    
    let thumbNailImageName: String
    let profileImageName: String
    let titleName: String
    let subTitleName: String

    func makeThumbNailImage() -> UIImage? {
        return UIImage(named: thumbNailImageName)
    }
    
    func makeProfileImage() -> UIImage? {
        return UIImage(named: profileImageName)
    }
        
    
}
