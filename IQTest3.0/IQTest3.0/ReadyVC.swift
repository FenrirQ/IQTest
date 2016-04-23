//
//  ReadyVC.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 4/21/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import UIKit

class ReadyVC: UIViewController {

    @IBOutlet var lbltieude: UILabel!
    @IBOutlet var lblchao: UILabel!
    let singleton = Singleton.share
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(singleton.ten)
        lbltieude.text = "Chào mừng đến với bài TEST IQ của Đại Đội 9 !"
        lblchao.text = "Chào " + self.singleton.ten + ", chúc bạn có một bài test thật tốt !"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
