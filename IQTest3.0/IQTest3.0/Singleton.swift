//
//  Singleton.swift
//  IQTest3.0
//
//  Created by Quang Ly Hoang on 4/20/16.
//  Copyright © 2016 FENRIRQ. All rights reserved.
//

import Foundation

class Singleton {
    class var share : Singleton {
        struct Static {
            static var instance : Singleton?
            static var token : dispatch_once_t = 0
        }
        
        dispatch_once(&Static.token) {
            Static.instance = Singleton()
        }
        
        return Static.instance!
    }
    
    var diem : Int = 0
    var username: String = ""
    var ten : String = ""
    var namsinh : Int = 0
    
}