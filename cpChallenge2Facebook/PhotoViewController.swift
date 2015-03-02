//
//  PhotoViewController.swift
//  cpChallenge2Facebook
//
//  Created by Jonlin Pei on 2/24/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    var image: UIImage!
    var imageOriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageView.image = image
        imageOriginalCenter = imageView.center

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonDidPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
    
        var offset = imageView.center.y - imageOriginalCenter.y
        var location = sender.locationInView(view)
        var translation = sender.translationInView(view)
        var velocity = sender.velocityInView(view)
        
        if (sender.state == UIGestureRecognizerState.Began){
            //started to pan
            println("Pan started")
            
        } else if (sender.state == UIGestureRecognizerState.Changed){
            //started to pan
            println("Pan changed")
            println("location: \(location)")
            println("translation: \(translation)")
            println("velocity: \(velocity)")
            println("offset: \(offset)")
            
            imageView.center.y = imageOriginalCenter.y + translation.y
            
        } else if (sender.state == UIGestureRecognizerState.Ended){
            //started to pan
            println("Pan ended")
            
            if (offset > 100.0) {
                dismissViewControllerAnimated(true, completion: nil)
            } else if (offset <= 100.0) {
                imageView.center.y = imageOriginalCenter.y
            }
            
            
        }

    }


}
