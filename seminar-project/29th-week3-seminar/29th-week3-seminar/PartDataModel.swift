//
//  PartDataModel.swift
//  29th-week3-seminar
//
//  Created by 안현주 on 2021/10/23.
//

import UIKit

struct PartData {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
