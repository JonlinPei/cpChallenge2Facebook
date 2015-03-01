//
//  PhotoViewController.swift
//  cpChallenge2Facebook
//
//  Created by Jonlin Pei on 2/24/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    
    var image: UIImage!
    var imageOriginalCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        photoViewScrollView.delegate = self
//        photoViewScrollView.contentSize = CGSize(width: 320, height: 700)

        imageView.image = image
        imageOriginalCenter = imageView.center

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonDidPress(sender: AnyObject) {
//        imageView.image = nil
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    @IBAction func didPanPhoto(sender: UIPanGestureRecognizer) {
////        dismissViewControllerAnimated(true, completion: nil)
//    }
    
    @IBAction func didPanImage(sender: UIPanGestureRecognizer) {
        
        var offset = (imageView.center.y - imageOriginalCenter.y)
        
        
        if (sender.state == UIGestureRecognizerState.Began){
            //started to pan
            println("Pan started")
            
        } else if (sender.state == UIGestureRecognizerState.Changed){
            //started to pan
            println("Pan changed")
            
            imageView.transform = CGAffineTransformMakeTranslation(0, offset)
            
            
        } else if (sender.state == UIGestureRecognizerState.Ended){
            //started to pan
            println("Pan ended")
        }

    }


}
