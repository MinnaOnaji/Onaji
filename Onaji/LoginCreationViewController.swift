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
import Parse

class LoginCreationViewController: UIViewController
{
    @IBOutlet weak var username: UITextField!

    @IBOutlet weak var password: UITextField!
    
    //var userInfo = UserInfo()
    
    override func viewDidLoad() {
        password.secureTextEntry = true
    }
    
    @IBAction func createLogin()
    {
        let account = UserInformation()
        account.username = username.text
        account.password = password.text
		
		account.signUpInBackgroundWithBlock {(success: Bool, error: NSError?) -> Void in
            if let error = error
			{
                // Show the errorString somewhere and let the user try again.
                _ = error.userInfo["error"] as? NSString
                print(error)
            }
			else
			{
                //account.instantiateUser()
                // Hooray! Let them use the app now.
                print("Account with username " + self.username.text! + " has been created successfully.")
            }
        }
    }
	
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
		if let _ = touches.first
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
