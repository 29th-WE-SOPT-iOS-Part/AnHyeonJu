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
        
//       (1) setData함수를 호출하고 나서 그냥 present를 하니까 데이터가 전달이 안된다. (문제)
//       (2) present의 completion에 setData로 데이터를 전달하니까 데이터 전달과정이 다 보인다. (문제2)
//       (3) DispatchQueue를 써서 몇초 딜레이한 후에 보여줄까 했는데 DispatchQueue를 어디다가 써야할지? 위치? 를 모르겠어서 패스!
//       (4) 결국 그냥 1차 과제 세미나 자료 찾아서 데이터 전달..!
        
        

//      (1)번방식
//      homeDetailVC.setData(image: image, title: title, description: description)
//      self.present(homeDetailVC, animated: true)

//      (2)번방식
//       self.present(homeDetailVC, animated: true){
//          homeDetailVC.setData(image: image, title: title, description: description)
//       }
        
//      (4)번 방식
        homeDetailVC.image1 = image
        homeDetailVC.title1 = title
        homeDetailVC.description1 = description
        
        self.present(homeDetailVC, animated: true)
        
    }
}
