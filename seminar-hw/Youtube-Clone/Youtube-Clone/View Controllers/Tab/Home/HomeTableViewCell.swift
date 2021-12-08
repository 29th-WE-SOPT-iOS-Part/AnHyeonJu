//
//  HomeTableViewCell.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/27.
//

import UIKit

protocol HomeTableViewCellDelegate{
    func ImageViewSelected(cell: HomeTableViewCell)
    func ImageViewUnSelected(cell: HomeTableViewCell, unselectedImage: String)
}

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeTableViewCell"

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var moreMenuImageView: UIImageView!
    @IBOutlet weak var imageBtn: UIButton!
    var homeTVCDelegate: HomeTableViewCellDelegate?
    var selectedImage: Bool = false
    var ImageViewData: [HomeContentData] = []
    
    var presentingClosure: (() -> ())?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - IBAction
    @IBAction func touchUpToSelect(_ sender: UIButton) {
        if selectedImage {
            homeTVCDelegate?.ImageViewUnSelected(cell: self,unselectedImage: Image)
        } else {
            homeTVCDelegate?.ImageViewSelected(cell: self)
            presentingClosure?()
        }
        selectedImage.toggle()
    }
    
    
    
    // MARK: - Custom Method
    func setData(rank: Int, appData: HomeContentData) {
        thumbnailImageView.image = appData.makeThumbNailImage()
        profileImageView.image = appData.makeProfileImage()
        titleLabel.text = appData.titleName
        subTitleLabel.text = appData.subTitleName
    }
    
    
    
}
