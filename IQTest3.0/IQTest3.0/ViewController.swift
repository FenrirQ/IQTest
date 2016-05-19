//
//  ViewController.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 4/18/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    let singleton = Singleton.share
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func login(sender: AnyObject) {
        
        let username = usernameTF.text
        let pass = passwordTF.text
        
        if username != "" && pass != "" {
            
            let appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
            let context: NSManagedObjectContext = appDel.managedObjectContext
            
            let request = NSFetchRequest(entityName: "Users")
//            request.returnsObjectsAsFaults = false
//            request.predicate = NSPredicate(format: "username = %@", usernameTF)
            
            do {
                let results = try context.executeFetchRequest(request)
                print(results.count)
                if results.count > 0 {
                    
//                    let res = results[0] as! NSManagedObject
//                    let user = res.valueForKey("username") as! String
//                    let password = res.valueForKey("password") as! String
                    var j :Int = 0
                    for i in 0...(results.count - 1){
                        let res = results[i] as! NSManagedObject
                        let user = res.valueForKey("username") as? String
                        let password = res.valueForKey("password") as? String
                        if user == username && password == pass {
                            
                            self.singleton.username = user!
                            self.singleton.ten = res.valueForKey("name") as! String
                            self.singleton.namsinh = res.valueForKey("birth") as! Int
                            print(self.singleton.username)
                            self.performSegueWithIdentifier("goToReady", sender: self)
                            j = 1
                            break
                            
                        } else if username == user && password != pass {
                            
                            let myAlert = UIAlertController(title: "Thông báo", message: "Mật khẩu chưa đúng !", preferredStyle: .Alert)
                            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                            myAlert.addAction(actionOK)
                            self.presentViewController(myAlert, animated : true, completion : nil)
                            j = 2
                            break
                        }
                    }
                    
                    if j == 0 {
                        
                        let myAlert = UIAlertController(title: "Thông báo", message: "Tài khoản không tồn tại !", preferredStyle: .Alert)
                        let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                        myAlert.addAction(actionOK)
                        self.presentViewController(myAlert, animated : true, completion : nil)
                        
                    }
                
                } else {
                    print("0 Result Returned ... Potential Error")
                }
            } catch let error as NSError {
                print("Fetch failed: \(error.localizedDescription)")
            }
            
        } else if username!.isEmpty && pass != "" {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập tài khoản !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else if username != "" && pass!.isEmpty {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập mật khẩu !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập tài khoản và mật khẩu !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        }
        
    }
    
    @IBAction func goTo(sender: AnyObject) {
        
        self.performSegueWithIdentifier("goTo", sender: self)
        
    }
}

