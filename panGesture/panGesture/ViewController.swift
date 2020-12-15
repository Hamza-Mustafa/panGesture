//
//  ViewController.swift
//  panGesture
//
//  Created by Hamza Mustafa on 15/12/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chetahImg: UIImageView!
    
    var xy : CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()
        xy = chetahImg.frame
    }
    
    @IBAction func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        guard let recognizerView = recognizer.view else {return}
        let transition = recognizer.translation(in: view)
        recognizerView.center.x += transition.x
        recognizerView.center.y += transition.y
        recognizer.setTranslation(.zero, in: view)
        
        if recognizer.state == .ended {
            UIView.animate(withDuration: 0.5) {
                self.chetahImg.frame = self.xy!
            }
        }
    }
}
