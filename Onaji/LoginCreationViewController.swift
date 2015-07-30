//
//  LoginCreationViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class LoginCreationViewController: UIViewController
{
    @IBOutlet weak var usernameEntered: UITextField!

    @IBOutlet weak var passwordEntered: UITextField!
    
    var userInfo = UserInfo()
    
    @IBAction func createLogin()
    {
        userInfo.addUser(usernameEntered.text, newPassword: passwordEntered.text)
    }
}
