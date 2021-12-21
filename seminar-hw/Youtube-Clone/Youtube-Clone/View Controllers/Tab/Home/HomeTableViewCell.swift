//
//  HomeTableViewCell.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/27.
//

import UIKit

protocol HomeVCDelegate {
    func tapToGoNextVC(image: UIImage, title: String, description: String)
}

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    static let identifier = "HomeTableViewCell"
    
    var homeTVCDelegate: HomeVCDelegate?

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var moreMenuImageView: UIImageView!
    
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setTapGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setTapGesture()
    }
    
    // MARK: - Custom Method
    func setData(rank: Int, appData: HomeContentData) {
        thumbnailImageView.image = appData.makeThumbNailImage()
        profileImageView.image = appData.makeProfileImage()
        titleLabel.text = appData.titleName
        subTitleLabel.text = appData.subTitleName
    }
    
    func setTapGesture() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView(gestureRecognizer:)))
    
        thumbnailImageView.addGestureRecognizer(tapRecognizer)
        
    }
    @objc func tapImageView(gestureRecognizer: UIGestureRecognizer){
             self.homeTVCDelegate?.tapToGoNextVC(image: thumbnailImageView.image ?? UIImage(), title: titleLabel.text ?? "", description: subTitleLabel.text ?? "")
    }
    
}


extension UIViewController: HomeVCDelegate {
    func tapToGoNextVC(image: UIImage, title: String, description: String) {
        let detailStoryboard = UIStoryboard.init(name: "Tabbar", bundle: nil)
        
        guard let homeDetailVC = detailStoryboard.instantiateViewController(withIdentifier: HomeDetailVC.identifier) as? HomeDetailVC else {return}
        
        homeDetailVC.modalPresentationStyle = .fullScreen
        
        homeDetailVC.detailTitleLabel.text = title
        homeDetailVC.detailImageView.image = image
        homeDetailVC.detailDescriptionLabel.text = description
        
        self.present(homeDetailVC, animated: true, completion: nil)
        
    }
}
