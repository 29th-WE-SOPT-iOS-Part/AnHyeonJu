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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUPToGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setData(image: UIImage, title: String, description: String) {
        detailImageView?.image = image
        detailTitleLabel?.text = title
        detailDescriptionLabel?.text = description
    }

}
