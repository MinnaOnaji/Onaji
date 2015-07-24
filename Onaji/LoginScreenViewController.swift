
//
//  LoginScreenViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController
{
    var userinfo = UserInfo()
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var loginState: UILabel!
    
    @IBAction func userLogin()
    {
        let loginSuccess = userinfo.testLogin(username.text,password:password.text)
        if(loginSuccess) {
            loginState.text = "ya"
        }
        else
        {
            loginState.text = "no"
        }
    }
}
