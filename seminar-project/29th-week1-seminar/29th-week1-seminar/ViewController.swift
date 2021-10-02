//
//  ViewController.swift
//  29th-week1-seminar
//
//  Created by 안현주 on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        testLabel.text = "WE SOPT 1차 세미나"
        testLabel.sizeToFit() //라벨 크기를 글자에 맞게 변경해주는 메소드
    }
    
    
    @IBAction func touchUpSecondView(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
            else {return}
        
        //중요한 개념 : optional
        // 무조건 확인 vs 확인 X 로 나뉨
        // ? 개념 사용
        
        //guard (조건) else { 조건이 false일 때 실행되는 부분}
        // else 안에는 break나 return과 같이 종료 구문이 있어야함
        
//        nextVC.modalPresentationStyle = .fullScreen //새로운 모달 창을 어떻게 보여줄지
//        nextVC.modalTransitionStyle = .crossDissolve // 새로운 모달창을 어떻게 전환할기
//
//        self.present(nextVC, animated: true, completion: nil)
//        //present함수를 통해 보달을 띄우기
        
        
        //네비게이션 방식
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
        
    }
    
    
}

