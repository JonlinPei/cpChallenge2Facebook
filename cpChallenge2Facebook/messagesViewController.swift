//
//  messagesViewController.swift
//  cpChallenge2Facebook
//
//  Created by Jonlin Pei on 2/4/15.
//  Copyright (c) 2015 Jonlin Pei. All rights reserved.
//

import UIKit

class messagesViewController: UIViewController {

    @IBOutlet weak var messageScrollView: UIScrollView!
    
    @IBOutlet weak var messageImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        messageScrollView.contentSize = messageImage.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
