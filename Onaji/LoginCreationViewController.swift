//
//  LoginCreationViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/23/15.
//  Copyright (c) 2015 Same. All rights reserved.
//
//  Create a new user in the database
//  

import UIKit
import CryptoSwift
import Parse

class LoginCreationViewController: UIViewController
{
    @IBOutlet weak var usernameEntered: UITextField!

    @IBOutlet weak var passwordEntered: UITextField!
    
    //var userInfo = UserInfo()
    
    override func viewDidLoad() {
        passwordEntered.secureTextEntry = true
    }
    
    @IBAction func createLogin()
    {
        //userInfo.addUser(usernameEntered.text, newPassword: passwordEntered.text)
        let account = PFUser()
        account.username = usernameEntered.text
        account.password = passwordEntered.text.sha256()
        account.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Account with username " + self.usernameEntered.text + " has been created successfully.")
        }
    }
	
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
	{
        if let touch = touches.first as? UITouch
		{
            self.view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
	{
        textField.resignFirstResponder()
        return true
    }
}
