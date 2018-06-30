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
    
    let overlay = UIView(frame: CGRect(x:0, y:0, width: 10, height: 10))
    var drawerIsOpen: Bool = true
    
    @IBAction func animateDrawer(_ sender: Any) {
        print("origin", drawer.bounds.origin)
        print("height", drawer.bounds.height)
        print("size", drawer.bounds.size)
        self.drawerIsOpen ? self.reveal() : self.hide()
    }
    
    func reveal() {
        let reveal = CGAffineTransform(translationX: 0, y: 0)
        let containerWidth = self.containerView.bounds.width
        let containerHeight = self.containerView.bounds.height
        
        self.containerView.bringSubview(toFront: self.drawer)
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            self.overlay.transform = CGAffineTransform(scaleX: containerWidth, y: containerHeight)
            self.drawer.transform = reveal
        }, completion: { (finished: Bool) in
            self.drawerIsOpen = true
        })
    }
    
    func hide() {
        let hide = CGAffineTransform(translationX: 0, y: self.drawer.bounds.height)
        let containerWidth = self.containerView.bounds.width
        let containerHeight = self.containerView.bounds.height
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseInOut, animations: {
            self.overlay.transform = CGAffineTransform(scaleX: containerWidth, y: containerHeight)
            self.drawer.transform = hide
        }, completion: { (finished: Bool) in
            self.drawerIsOpen = false
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.addSubview(overlay)
        self.overlay.backgroundColor = UIColor.black
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

