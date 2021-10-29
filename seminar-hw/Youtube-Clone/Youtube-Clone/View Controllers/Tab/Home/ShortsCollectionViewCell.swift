//
//  HomeCollectionViewCell.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/28.
//

import UIKit

class ShortsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "ShortsCollectionViewCell"
    @IBOutlet weak var shortsImageView: UIImageView!
    @IBOutlet weak var shortsNameLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Custom Method
    func setData(appName: String, appImage: UIImage?){
        shortsNameLabel.text = appName
        shortsImageView.image = appImage
    }

}
