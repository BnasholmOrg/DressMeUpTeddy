//
//  ViewController.swift
//  DressMeUpTeddy
//
//  Created by Breanna Nasholm on 8/11/17.
//  Copyright © 2017 Breanna Nasholm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var originalCenter = CGPoint.zero
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        switch(recognizer.state){
        case UIGestureRecognizerState.began:
            if let originalView = recognizer.view {
            originalCenter = originalView.center
            print("Original Center \(originalCenter)")
            }
        case UIGestureRecognizerState.changed:
            let translation = recognizer.translation(in: self.view)
            if let view = recognizer.view {
                view.center = CGPoint(x:view.center.x + translation.x,
                                      y:view.center.y + translation.y)
            }
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        case UIGestureRecognizerState.ended:
            if let newView = recognizer.view {
                print("OriginalCenter.x \(originalCenter.x)")
                newView.center = originalCenter
                print ("New position \(newView.center)")
            }
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        default: break
        }
    }

}

