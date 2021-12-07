//
//  homeCollectionDataModel.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/28.
//

import UIKit

struct ShortsCollectionContentData {
    let shortsImageName: String
    let shortsTitleName: String

    func makeImage() -> UIImage? {
        return UIImage(named: shortsImageName)
    }
}
