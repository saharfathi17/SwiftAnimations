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
    var drawerIsOpen: Bool?
    
    @IBAction func animateDrawer(_ sender: Any) {
        self.drawerIsOpen! ? self.hide() : self.reveal()
    }
    
    func reveal() {
        let reveal = CGAffineTransform(translationX: 0, y: 0)
        let containerWidth = self.containerView.bounds.width
        let containerHeight = self.containerView.bounds.height
        
        self.containerView.bringSubview(toFront: self.drawer)
        self.overlay.transform = CGAffineTransform(scaleX: containerWidth, y: containerHeight)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.overlay.alpha = 0.2
            self.drawer.transform = reveal
        }, completion: { (finished: Bool) in
            self.drawerIsOpen = true
        })
    }
    
    func hide() {
        let hide = CGAffineTransform(translationX: 0, y: self.drawer.bounds.height)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: {
            self.overlay.alpha = 0
            self.drawer.transform = hide
        }, completion: { (finished: Bool) in
            self.drawerIsOpen = true
            let containerWidth = self.containerView.bounds.width
            self.overlay.transform = CGAffineTransform(scaleX: containerWidth, y: 0)
            self.drawerIsOpen = false
        })
        
    }
    
    @objc func handleOverlayTap(tap: UITapGestureRecognizer) {
        self.hide()
    }
    
    @objc func handleOverlayPan(pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: self.overlay)
        self.drawer.transform = CGAffineTransform(translationX: 0, y: translation.y * self.drawer.bounds.height)
        self.overlay.alpha = 0.2 - (translation.y / 5)
        if (pan.state == UIGestureRecognizerState.ended) {
           self.setDrawerOnGestureEnd(translation: translation)
        }
    }
    
    func setDrawerOnGestureEnd(translation: CGPoint) {
        if (translation.y <= 0.25) {
            self.reveal()
        } else {
            self.hide()
        }
    }
    
    func addShadowToDrawer() {
        self.drawer.layer.shadowColor = UIColor.black.cgColor
        self.drawer.layer.shadowRadius = 5
        self.drawer.layer.shadowOpacity = 0.5
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawerIsOpen = true
        self.addShadowToDrawer()
        self.overlay.alpha = 0
        let makeFullWidth = CGAffineTransform(scaleX: self.containerView.bounds.width, y: 0)
        self.overlay.transform = makeFullWidth
        self.containerView.addSubview(overlay)
        self.overlay.backgroundColor = UIColor.black
        let overlayPanSwipe = UIPanGestureRecognizer(target: self, action: #selector(handleOverlayPan))
        self.containerView.addGestureRecognizer(overlayPanSwipe)
        let overlayHide = UITapGestureRecognizer(target: self, action: #selector(handleOverlayTap))
        self.overlay.addGestureRecognizer(overlayHide)
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

