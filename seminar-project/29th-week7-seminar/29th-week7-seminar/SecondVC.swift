//
//  SecondVC.swift
//  29th-week7-seminar
//
//  Created by 안현주 on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {

  static let identifier = "SecondVC"
    @IBOutlet weak var textfield: UITextField!
    var receivedText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.text = receivedText
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        // 3. Notification 방법
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"),
                                              object: textfield.text ?? "")
        
        
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textField.text = textfield.text
        dismiss(animated: true, completion: nil)
    }
    
    func setDataInTextField(data: String){
        print("넘겨받은 데이터 = \(data)")
    }

}

