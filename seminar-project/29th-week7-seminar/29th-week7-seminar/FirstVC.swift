//
//  FirstVC.swift
//  29th-week7-seminar
//
//  Created by 안현주 on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {

    static let identifier = "FirstVC"
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
//        // 1. present/push 방법
//        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}
//        nextVC.receivedText = textField.text ?? ""
//        present(nextVC, animated: true, completion: nil)
        
        // 2. Segue 방법
//        performSegue(withIdentifier: "presentSecondVC", sender: sender)
        
        // 3. Notification 방법
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}
        nextVC.receivedText = textField.text ?? ""
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dataReceived),
                                               name: NSNotification.Name("iOS_Sample"),
                                               object: nil)
        
        present(nextVC, animated: true, completion: nil)
        
    }
    
    // 3. Notification 방법
    @objc func dataReceived(notification: NSNotification){
        if let text = notification.object as? String{
            textField.text = text
        }
    }
    
    
    // 2. Segue 방법
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "presentSecondVC"{
//            let nextVC = segue.destination as? SecondVC
//            nextVC?.receivedText = textField.text ?? ""
//        }
//    }
    



}
