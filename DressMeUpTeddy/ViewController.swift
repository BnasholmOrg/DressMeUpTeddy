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
    @IBOutlet weak var teddyImage: UIImageView!
    @IBOutlet weak var shirtImage: UIImageView!
    @IBOutlet weak var pantsImage: UIImageView!
    @IBOutlet weak var trashCanImage: UIButton!
    
    var originalCenter = CGPoint.zero
    var shirt = false
    var pants = false
    
    @IBAction func handleTap(sender: UITapGestureRecognizer){
        teddyImage.image = UIImage(named: "teddy.png")
        pants = false
        shirt = false
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        switch(recognizer.state){
            case UIGestureRecognizerState.began:
                if let originalView = recognizer.view {
                    originalCenter = originalView.center
                }
            case UIGestureRecognizerState.changed:
                let translation = recognizer.translation(in: self.view)
                if let view = recognizer.view {
                    view.center = CGPoint(x:view.center.x + translation.x, y:view.center.y + translation.y)
                }
                recognizer.setTranslation(CGPoint.zero, in: self.view)
            case UIGestureRecognizerState.ended:
                if let newView = recognizer.view {
                    if(newView.center.x >= teddyImage.frame.minX && newView.center.x <= teddyImage.frame.maxX && newView.center.y >= teddyImage.frame.minY && newView.center.y <= teddyImage.frame.maxY){
                    
                        if((newView.tag==0 && pants) || (newView.tag==1 && shirt)){
                            teddyImage.image = UIImage(named: "teddy-w-shirtandpants.png")
                            shirt = true
                            pants = true
                        } else if (newView.tag==0 && !pants ){
                            teddyImage.image = UIImage(named: "teddy-w-shirt.png")
                            shirt = true
                        } else if (newView.tag==1 && !shirt){
                            teddyImage.image = UIImage(named: "teddy-w-pants.png")
                            pants = true
                        }
                        newView.center = originalCenter
                    }
                    recognizer.setTranslation(CGPoint.zero, in: self.view)
            }
        default: break
        }
    }

}

