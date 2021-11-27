//
//  GestureVC.swift
//  29th-week7-seminar
//
//  Created by 안현주 on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //제스처 인식기 초기화및 설정
        let tapRecognizer = UITapGestureRecognizer(target: self,
                                                   action: #selector(tapView(gestureRecognizer:)))
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer2.addTarget(self, action: #selector(tapView(gestureRecognizer:)))
        
        //뷰에 제스쳐 연결
        testView.addGestureRecognizer(tapRecognizer)
                                 
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer){
        print("뷰 안에서 탭")
    }



}
