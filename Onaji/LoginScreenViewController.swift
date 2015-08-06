
//
//  LoginScreenViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//
//  Make sure the segue works correctly
//  

import UIKit

class LoginScreenViewController: UIViewController
{
    var userinfo = UserInfo()
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var loginState: UILabel!
    
    private var loginSuccess: Bool = false
    
    private enum Constants
    {
        static let yesMessage = "ya"
        static let noMessage = "no"
    }
    
    @IBAction func userLogin()
    {
        loginSuccess = userinfo.testLogin(username.text,password:password.text)
        
        if(loginSuccess)
        {
            loginState.text = Constants.yesMessage
            loadDestinationVC()
        }
        else
        {
            loginState.text = Constants.noMessage
        }
    }
    
    //This is for the segue named "loginCorrect"
    func loadDestinationVC()
    {
        if loginSuccess
        {
            self.performSegueWithIdentifier("loginCorrect", sender:nil)
        }
    }
}
