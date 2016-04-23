//
//  SignupVC.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 4/18/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import UIKit
import CoreData

class SignupVC: UIViewController {

    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var repPasswordTF: UITextField!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var birthTF: UITextField!
    var users = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func back(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func signup(sender: AnyObject) {
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let entity = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        //let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context) as NSManagedObject
        let newUser = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: context)
        
        let username = usernameTF.text
        let pass = passwordTF.text
        let repPass = repPasswordTF.text
        let name = nameTF.text
        let birth = birthTF.text
        
        if username != "" && pass != "" && repPass != "" && name != "" && birth != "" {
            if pass == repPass {
                
                
                let appDel = (UIApplication.sharedApplication().delegate as! AppDelegate)
                let context: NSManagedObjectContext = appDel.managedObjectContext
                
                let request = NSFetchRequest(entityName: "Users")
                do {
                    
                    let results = try context.executeFetchRequest(request)
                    if results.count > 0 {
                        
                        for i in 0...(results.count - 1){
                            
                            let res = results[i] as! NSManagedObject
                            let user = res.valueForKey("username") as! String
                            if username == user {
                                
                                let myAlert = UIAlertController(title: "Thông báo", message: "Tài khoản đã tồn tại !", preferredStyle: .Alert)
                                let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                                myAlert.addAction(actionOK)
                                self.presentViewController(myAlert, animated : true, completion : nil)
                                break
                                
                            }

                        }
                    }
                } catch let error as NSError {
                    print("Fetch failed: \(error.localizedDescription)")
                }
                
                newUser.setValue(usernameTF.text, forKey: "username")
                newUser.setValue(passwordTF.text, forKey: "password")
                newUser.setValue(nameTF.text, forKey: "name")
                newUser.setValue(Int(birthTF.text!), forKey: "birth")
                
                do {
                    
                    try context.save()
                    users.append(newUser)
        
                    
                } catch {
                    
                    fatalError("Failure to save context: \(error)")
                    
                }
                
                let myAlert = UIAlertController(title: "Chúc mừng", message: "Bạn đã đăng kí thành công !", preferredStyle: .Alert)
                let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {(paramAction: UIAlertAction!)in self.dismissViewControllerAnimated(true, completion: nil)})
                myAlert.addAction(actionOK)
                self.presentViewController(myAlert, animated : true, completion : nil)
                
            } else if Int(birth!)! > 2016 || Int(birth!) == nil {
                
                let myAlert = UIAlertController(title: "Thông báo", message: "Năm sinh không đúng !", preferredStyle: .Alert)
                let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                myAlert.addAction(actionOK)
                self.presentViewController(myAlert, animated : true, completion : nil)
                
            } else {
                
                let myAlert = UIAlertController(title: "Thông báo", message: "Mật khẩu không trùng khớp !", preferredStyle: .Alert)
                let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                myAlert.addAction(actionOK)
                self.presentViewController(myAlert, animated : true, completion : nil)
                
            }
        } else if username!.isEmpty && pass != "" && repPass != "" && name != "" && birth != "" {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập tên tài khoản !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else if username != "" && pass!.isEmpty && repPass != "" && name != "" && birth != "" {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập mật khẩu !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else if username != "" && pass != "" && repPass!.isEmpty && name != "" && birth != "" {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập lại mật khẩu !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else if username != "" && pass != "" && repPass != "" && name!.isEmpty && birth != "" {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập họ tên !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else if username != "" && pass != "" && repPass != "" && name != "" && birth!.isEmpty {
            
            let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập năm sinh !", preferredStyle: .Alert)
            let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            myAlert.addAction(actionOK)
            self.presentViewController(myAlert, animated : true, completion : nil)
            
        } else {
                
                let myAlert = UIAlertController(title: "Thông báo", message: "Bạn chưa nhập hết thông tin !", preferredStyle: .Alert)
                let actionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
                myAlert.addAction(actionOK)
                self.presentViewController(myAlert, animated : true, completion : nil)
            
        }
    }
    
    

}
