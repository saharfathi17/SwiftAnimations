//
//  ViewController.swift
//  AnimateSwift
//
//  Created by Tyler Walker on 6/21/18.
//  Copyright © 2018 Tyler Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var drawer: UIView!
    
    @IBAction func animateDrawer(_ sender: Any) {
        print("origin", drawer.bounds.origin)
        print("height", drawer.bounds.height)
        print("size", drawer.bounds.size)
        let makeNotTheSame = CGAffineTransform(translationX: 0, y: self.containerView.bounds.height)
        let increment = CGAffineTransform(translationX: 0, y: 100)
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            self.drawer.transform = increment
        }, completion: nil)
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//            self.drawer.center.y = self.drawer.bounds.height
//            self.drawer.transform = makeNotTheSame
//        }, completion: nil)
    }
    @IBOutlet weak var boxy: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

