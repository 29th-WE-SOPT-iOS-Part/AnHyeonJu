//
//  ViewController.swift
//  29th-week8-seminar
//
//  Created by 안현주 on 2021/12/18.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    //@IBOutlet
    @IBOutlet weak var targetView: UIView!
    var animator: UIViewPropertyAnimator?
    
    lazy var lottieView: AnimationView = {
        let animationView = AnimationView(name: "seminar8-sample")
        animationView.frame = CGRect(x:0, y:0, width: 300, height:300)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        
        return animationView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        initAnimator()
        view.addSubview(lottieView)
    }

    //function
//    func initAnimator(){
//        animator = UIViewPropertyAnimator(duration: 3, curve: .easeInOut){
//            self.targetView.frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100)
//        }
//
//        animator?.addAnimations {
//            self.targetView.backgroundColor = .orange
//        }
//
//        animator?.addCompletion{ position in
//                                 print(position.rawValue)
//                                 print("completion 블록 호출됨")
//        }
//    }
    
    
    //@IBAction
    @IBAction func touchUpToStartAnimation(_ sender: Any) {
//        animator?.startAnimation()
        lottieView.isHidden = false
        lottieView.play()
    }
    @IBAction func touchUpToPauseAnimation(_ sender: Any) {
//        animator?.pauseAnimation()
        lottieView.pause()
    }
    @IBAction func touchUpToStopAnimation(_ sender: Any) {
//        animator?.stopAnimation(true)
//        animator?.stopAnimation(false)
//        animator?.finishAnimation(at: .current)
        lottieView.isHidden = true
        lottieView.stop()
    }
    

}

