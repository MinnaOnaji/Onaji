//
//  UserInfo.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import Foundation

class UserInfo {
    
//    var userLoginInfo = [String:String]()

    var userLoginInfo: [String:String]
    init() {
        if let retrieveInfo: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("logins")
        {
            userLoginInfo = retrieveInfo as! [String:String]
        }
        else
        {
            userLoginInfo = [String:String]()
        }
    }
    
    func addUser(newUserName: String, newPassword: String) {
        userLoginInfo[newUserName] = newPassword
        NSUserDefaults.standardUserDefaults().setObject(userLoginInfo, forKey: "logins")
    }
    func testLogin(username: String, password: String) -> Bool {
        if userLoginInfo[username] == password {
            return true
        }
        return false
        
        
    }

}
