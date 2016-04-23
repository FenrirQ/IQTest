//
//  ResultVC.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 4/22/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet var congratulationlbl: UILabel!
    @IBOutlet var iqlbl: UILabel!
    @IBOutlet var commentlbl: UILabel!
    @IBOutlet var bestlbl: UILabel!
    @IBOutlet var minelbl: UILabel!
    let singleton = Singleton.share
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        congratulationlbl.text = "Chúc mừng " + self.singleton.ten + ", bạn đã hoàn thành xong bài test !"
        iqlbl.text = String(Int((self.singleton.diem / (2016 - self.singleton.namsinh)) * 100))
        let iq = Int((self.singleton.diem / (2016 - self.singleton.namsinh)) * 100)
        if iq <= 100 {
            commentlbl.text = "Bạn khá là ngốc !"
        } else if iq > 100 && iq <= 130 {
            commentlbl.text = "Bạn có trí thông minh ở mức trung bình !"
        } else if iq > 130 && iq <= 150 {
            commentlbl.text = "Bạn rất thông minh !"
        } else {
            commentlbl.text = "Chúc mừng ! Bạn là thiên tài !"
        }
        
        if iq > Int(bestlbl.text!)! {
            bestlbl.text = String(iq)
            minelbl.text = "của " + self.singleton.ten + " ( " + self.singleton.username + " )"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func againAction(sender: AnyObject) {
        let myAlert = UIAlertController(title: "", message: "Bạn muốn chơi lại ?", preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.again()})
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(actionCancel)
        myAlert.addAction(actionOK)
        self.presentViewController(myAlert, animated : true, completion : nil)

    }

    @IBAction func logoutAction(sender: AnyObject) {
        
        let myAlert = UIAlertController(title: "", message: "Bạn muốn đăng xuất ?", preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.logout()})
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(actionCancel)
        myAlert.addAction(actionOK)
        self.presentViewController(myAlert, animated : true, completion : nil)
        
    }
    
    @IBAction func quitAction(sender: AnyObject) {
        let myAlert = UIAlertController(title: "", message: "Bạn muốn thoát khỏi ứng dụng ?", preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.quit()})
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(actionCancel)
        myAlert.addAction(actionOK)
        self.presentViewController(myAlert, animated : true, completion : nil)
    }
    
    func logout() {
        self.performSegueWithIdentifier("returnLogin", sender: self)
        self.singleton.diem = 0
        self.singleton.namsinh = 0
        self.singleton.ten = ""
        self.singleton.username = ""
    }
    
    func again() {
        self.performSegueWithIdentifier("returnTest", sender: self)
        self.singleton.diem = 0

    }

    func quit() {
        exit(0)
    }
}
