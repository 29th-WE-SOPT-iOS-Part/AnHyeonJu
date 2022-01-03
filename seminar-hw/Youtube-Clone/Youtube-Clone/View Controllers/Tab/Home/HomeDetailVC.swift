//
//  HomeDetailVC.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/12/19.
//

import UIKit

class HomeDetailVC: UIViewController {

    static let identifier = "HomeDetailVC"
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var image1 : UIImage?
    var title1: String?
    var description1: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDetailData()
    }
    
    @IBAction func touchUPToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setDetailData(){
        detailImageView.image = image1
        detailTitleLabel.text = title1
        detailDescriptionLabel.text = description1
    }
    
//    func setData(image: UIImage, title: String, description: String) {
//        detailImageView?.image = image
//        detailTitleLabel?.text = title
//        detailDescriptionLabel?.text = description
//    }

}
