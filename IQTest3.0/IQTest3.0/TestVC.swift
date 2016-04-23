//
//  TestVC.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 4/21/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import UIKit

class TestVC: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var numberlbl: UILabel!
    @IBOutlet var recordlbl: UILabel!
    @IBOutlet var timelbl: UILabel!
    var timer : NSTimer!
    var n : Int = 0
    var number : Int = 1
    let singleton = Singleton.share
    
    var imageArray = ["image1.png", "image3.png", "image4.png", "image5.png", "image6.png", "image7.png", "image8.png", "image9.png", "image10.png", "image11.png", "image12.png", "image14.png", "image21.png", "image23.png", "image28.png", "image31.png", "image32.png", "image33.png", "image36.png", "image37.png", "image38.png", "image39.png", "image40.png", "image41.png", "image43.png", "image44.png", "image45.png", "image46.png", "image47.png", "image49.png", "image52.png", "image53.png", "image55.png", "image56.png", "image57.png", "image59.png", "image61.png", "image62.png", "image64.png", "image66.png", "image68.png", "image70.png", "image71.png", "image72.png", "image73.png", "image74.png", "image91.png", "image92.png", "image94.png", "image95.png", "image98.png", "image99.png", "image100.png"]
    
    var answerArray = [ "b", "d", "c", "c", "b", "c", "d", "a", "c", "d", "a", "d", "b", "b", "d", "b", "d", "a", "b", "d", "a", "d", "b", "a", "a", "d", "d", "a", "d", "b", "d", "c", "d", "b", "d", "b", "c", "c", "a", "d", "c", "d", "c", "b", "d", "d", "a", "c", "c", "b", "b", "a", "c",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runtime()
        random()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func random() {
        let rand = arc4random_uniform(UInt32(imageArray.count))
        n = Int(rand)
        image.image = UIImage(named: imageArray[Int(rand)])
    }
    
    func runtime() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Run"), userInfo: nil, repeats: true)
    }
    
    func Run() {
        var n : Int = Int(timelbl.text!)!
        n = n - 1
        timelbl.text = String(n)
        if n == 0 {
            
            timer.invalidate()
            
            let myAlert = UIAlertController(title: "Thông báo !", message: "Đã hết thời gian làm bài !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.performSegueWithIdentifier("goToResult", sender: self)})
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        }
    }
    
    @IBAction func buttonA(sender: AnyObject) {
        
        if answerArray[n] == "a" {
            self.singleton.diem += 2
            recordlbl.text = String(self.singleton.diem)
        }
        
        if number == 20 {
            
            let myAlert = UIAlertController(title: "Thông báo !", message: "Bạn đã hoàn thành xong bài test !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.performSegueWithIdentifier("goToResult", sender: self)})
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            return
            
        }
        
        random()
        number++
        numberlbl.text = String(number)
        
    }
    
    @IBAction func buttonB(sender: AnyObject) {
        
        if answerArray[n] == "b" {
            self.singleton.diem += 2
            recordlbl.text = String(self.singleton.diem)
        }
        
        if number == 20 {
            
            let myAlert = UIAlertController(title: "Thông báo !", message: "Bạn đã hoàn thành xong bài test !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.performSegueWithIdentifier("goToResult", sender: self)})
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            return
            
        }
        
        random()
        number++
        numberlbl.text = String(number)
        
    }

    @IBAction func buttonC(sender: AnyObject) {
        
        if answerArray[n] == "c" {
            self.singleton.diem += 2
            recordlbl.text = String(self.singleton.diem)
        }
        
        if number == 20 {
            
            let myAlert = UIAlertController(title: "Thông báo !", message: "Bạn đã hoàn thành xong bài test !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.performSegueWithIdentifier("goToResult", sender: self)})
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            return
            
        }
        
        random()
        number++
        numberlbl.text = String(number)
        
    }
    
    @IBAction func buttonD(sender: AnyObject) {
        
        if answerArray[n] == "d" {
            self.singleton.diem += 2
            recordlbl.text = String(self.singleton.diem)
        }
        
        if number == 20 {
            
            let myAlert = UIAlertController(title: "Thông báo !", message: "Bạn đã hoàn thành xong bài test !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.performSegueWithIdentifier("goToResult", sender: self)})
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            return
            
        }
        
        random()
        number++
        numberlbl.text = String(number)
        
    }
    
    @IBAction func finish(sender: AnyObject) {
        
        let myAlert = UIAlertController(title: "Thông báo !", message: "Bạn có chắc là muốn nộp bài luôn không !", preferredStyle: .Alert)
        let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.performSegueWithIdentifier("goToResult", sender: self)})
        let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(actionCancel)
        myAlert.addAction(actionOK)
        self.presentViewController(myAlert, animated : true, completion : nil)
        
    }
}
