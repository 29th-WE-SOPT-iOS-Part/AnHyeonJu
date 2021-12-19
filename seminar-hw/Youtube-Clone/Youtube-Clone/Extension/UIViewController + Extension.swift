//
//  UIViewController + Extension.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/11/11.
//

import Foundation
import UIKit

extension UIViewController {

    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> ())? = nil)
    {
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}

extension UIViewController: HomeVCDelegate {
    func tapToGoNextVC(image: UIImage, title: String, description: String) {
        guard let homeDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeDetailVC") as? HomeDetailVC else {return}
        homeDetailVC.modalPresentationStyle = .fullScreen
        self.present(homeDetailVC, animated: true, completion: {
            homeDetailVC.detailTitleLabel.text = title
            homeDetailVC.detailImageView.image = image
            homeDetailVC.detailDescriptionLabel.text = description
        })
        
        
    }
}

protocol HomeVCDelegate {
    func tapToGoNextVC(image: UIImage, title: String, description: String)
}
