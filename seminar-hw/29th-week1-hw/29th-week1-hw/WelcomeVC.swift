//
//  WelcomeViewController.swift
//  29th-week1-hw
//
//  Created by 안현주 on 2021/10/06.
//

import UIKit

class WelcomeVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNameInLabel()
    }
    
    func setNameInLabel(){
        if let nme = name {
            nameLabel.text = nme
            nameLabel.sizeToFit()
        }
    }
    
    
}
