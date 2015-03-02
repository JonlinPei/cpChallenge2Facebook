//
//  feedViewController.swift
//  cpChallenge2Facebook
//
//  Created by Jonlin Pei on 2/4/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class feedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning, UIScrollViewDelegate {

    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    var selectedImageView: UIImageView!
    var isPresenting: Bool = true
    var endFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        feedScrollView.delegate = self
        feedScrollView.contentSize = feedImage.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var destinationViewController = segue.destinationViewController as PhotoViewController
        
        destinationViewController.image = selectedImageView.image
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        var movingImageView: UIImageView = UIImageView(image: selectedImageView.image)
        var movingImageViewX = selectedImageView.center.x
        var movingImageViewY = selectedImageView.center.y
        movingImageView.center = selectedImageView.center
        movingImageView.contentMode = selectedImageView.contentMode
        movingImageView.clipsToBounds = selectedImageView.clipsToBounds
        movingImageView.transform = CGAffineTransformMakeScale(0.001, 0.001)


        
        var window = UIApplication.sharedApplication().keyWindow!
        window.addSubview(movingImageView)
        var startFrame = window.convertRect(selectedImageView.frame, fromView: feedScrollView)
        endFrame = startFrame
        
        
//        println("startFrame x: \(startFrame.frame.center.x); movingImageView y: \(movingImageView.center.y)")
        println("movingImageView x: \(movingImageView.center.x); movingImageView y: \(movingImageView.center.y)")

        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            var photoViewController = toViewController as PhotoViewController

            
            movingImageView.frame = startFrame
//            movingImageView.center.x = selectedImageView.center.x
//            movingImageView.center.y = selectedImageView.center.y

//            movingImageView.frame.size = selectedImageView.frame.size
            movingImageView.contentMode = .ScaleAspectFit
//            movingImageView.center.x = selectedImageView.center.x
//            movingImageView.center.y = selectedImageView.center.y + 110
            

            UIView.animateWithDuration(0.4, animations: { () -> Void in
                movingImageView.frame = photoViewController.imageView.frame
                toViewController.view.alpha = 1
                photoViewController.imageView.hidden = true
//                movingImageView.contentMode = .ScaleAspectFit

                println("SelectedImageView center x: \(self.selectedImageView.center.x); selectedImageview center Y: \(self.selectedImageView.center.y)")
                }) { (finished: Bool) -> Void in
                    photoViewController.imageView.hidden = false
                    transitionContext.completeTransition(true)
                    movingImageView.removeFromSuperview()
            }
        } else {
            movingImageView.frame = fromViewController.view.frame
            movingImageView.contentMode = .ScaleAspectFit
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                movingImageView.frame = self.endFrame
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
//                    movingImageView.contentMode = .ScaleAspectFill
                    movingImageView.removeFromSuperview()
            }
        }

        
        // TODO: animate the transition in Step 3 below
    }
    
    
    
    
    
    
    
    @IBAction func didTapPicture(sender: UITapGestureRecognizer) {
        var imageView = sender.view as UIImageView
        selectedImageView = imageView
        
        performSegueWithIdentifier("photoViewSegue", sender: self)
    }







}
