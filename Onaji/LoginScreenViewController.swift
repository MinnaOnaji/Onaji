
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
import Parse

class LoginScreenViewController: UIViewController
{
    //var userinfo = UserInfo()
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var loginState: UILabel!
    
    private var loginSuccess: Bool = false
    
    private enum Constants
    {
        static let yesMessage = "ya"
        static let noMessage = "no"
    }
    
    override func viewDidLoad() {
        password.secureTextEntry = true
    }
    
    @IBAction func userLogin()
    {
        //loginSuccess = userinfo.testLogin(username.text,password:password.text)
        
        UserInformation.logInWithUsernameInBackground(username.text, password:password.text) {
            (user: PFUser?, error: NSError?) -> Void in

            if user != nil {
                let userInfo = UserInformation.currentUser()
                println(userInfo)
                
                self.loginState.text = Constants.yesMessage
                self.performSegueWithIdentifier("loginCorrect", sender:self)
            } else {
                // The login failed. Check error to see why.
                self.loginState.text = Constants.noMessage
                println(error)
            }
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if let touch = touches.first as? UITouch{
            self.view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
