//
//  UXPrinciplesViewController.swift
//  AnimateSwift
//
//  Created by Tyler Walker on 7/9/18.
//  Copyright © 2018 Tyler Walker. All rights reserved.
//

import UIKit

class UXPrinciplesViewController: UIViewController {
    @IBOutlet weak var easingBox: UIView!
    
    @IBAction func moveForward(_ sender: Any) {
        let moveRight = CGAffineTransform(translationX: , y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.easingBox.transform = moveRight
        })
    }
    @IBAction func moveBackward(_ sender: Any) {
       print("moving backward")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
