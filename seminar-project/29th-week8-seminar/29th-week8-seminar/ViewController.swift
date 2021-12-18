//
//  ViewController.swift
//  29th-week8-seminar
//
//  Created by 안현주 on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    //@IBOutlet
    @IBOutlet weak var targetView: UIView!
    var animator: UIViewPropertyAnimator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAnimator()
    }

    //function
    func initAnimator(){
        animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut){
            self.targetView.frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100)
        }
        
        animator?.addAnimations {
            self.targetView.backgroundColor = .orange
        }
        
        animator?.addCompletion{ position in
                                 print(position.rawValue)
                                 print("completion 블록 호출됨")
        }
//        //읭..?
//        animator?.addCompletion{
//            print($0 rawValue)
//            print("completion 블록 호출됨")
//        }
        
    }
    
    
    //@IBAction
    @IBAction func touchUpToStartAnimation(_ sender: Any) {
        animator?.startAnimation()
    }
    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
        animator?.pauseAnimation()
    }
    @IBAction func touchUpToStopAnimation(_ sender: Any) {
        animator?.stopAnimation(true)
        animator?.stopAnimation(false)
        animator?.finishAnimation(at: .current)
    }
    

}

