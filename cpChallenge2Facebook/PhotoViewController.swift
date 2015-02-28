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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = image

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonDidPress(sender: AnyObject) {
//        imageView.image = nil
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
