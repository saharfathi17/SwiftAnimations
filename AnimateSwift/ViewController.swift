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
    @IBOutlet weak var boxy: UIView!
    
    var drawerIsOpen: Bool = true
    
    @IBAction func animateDrawer(_ sender: Any) {
        print("origin", drawer.bounds.origin)
        print("height", drawer.bounds.height)
        print("size", drawer.bounds.size)
        self.drawerIsOpen ? self.hide() : self.reveal()
        print(self.drawerIsOpen)
//        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
//            self.drawer.center.y = self.drawer.bounds.height
//            self.drawer.transform = makeNotTheSame
//        }, completion: nil)
    }
    
    func reveal() {
        let reveal = CGAffineTransform(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            self.drawer.transform = reveal
        }, completion: { (finished: Bool) in
            self.drawerIsOpen = true
        })
    }
    
    func hide() {
        let hide = CGAffineTransform(translationX: 0, y: self.drawer.bounds.height)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            self.drawer.transform = hide
        }, completion: { (finished: Bool) in
            self.drawerIsOpen = false
        })
    }
    
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

