//
//  GuideVC.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 5/12/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import UIKit

class GuideVC: UIViewController {
    
    @IBOutlet var guide: UIImageView!
    let image = UIImage(named: "Screen Shot 2016-05-12 at 7.37.36 PM.png")

    override func viewDidLoad() {
        super.viewDidLoad()

        guide.image = image
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
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
