//
//  GeneralSettingsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 8/6/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit
import Parse

class GeneralSettingsViewController: UIViewController
{
	@IBOutlet weak var oldPasswordTextField: UITextField!
	@IBOutlet weak var newPasswordTextField: UITextField!
	@IBOutlet weak var confirmPasswordTextField: UITextField!
	@IBOutlet weak var newEmailTextField: UITextField!

	@IBAction func saveClicked()
	{
		println("save clicked")
		//Checks that old password is correct
		//Checks new and confirm password match
//		if newPasswordsMatch() && oldPasswordMatch()
//		{
//			UserInformation.currentUser()?.password = newPasswordTextField.text
//		}
		UserInformation.currentUser()?.password = newPasswordTextField.text
		UserInformation.currentUser()?.email = newEmailTextField.text
		UserInformation.currentUser()?.saveInBackgroundWithBlock {(success: Bool, error: NSError?) -> Void in
			if let error = error
			{
				// Show the errorString somewhere and let the user try again.
				let errorString = error.userInfo?["error"] as? NSString
				println(error)
			}
			else
			{
				println(UserInformation.currentUser())
			}
		}
	}
	
	override func viewDidLoad()
	{
		oldPasswordTextField.secureTextEntry = true
		newPasswordTextField.secureTextEntry = true
		confirmPasswordTextField.secureTextEntry = true
		newEmailTextField.text = UserInformation.currentUser()?.email
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if segue.identifier == "saveUnwind"
		{
			saveClicked()
		}
	}
	
	func oldPasswordMatch() -> Bool
	{
		//Checks that old password is correct
		if let password = oldPasswordTextField.text
		{
			//HELP HERE
			if password == UserInformation.currentUser()?.password!
			{
				println("Password correct")
				return true
			}
		}
		else
		{
			println("Old password from database missing")
		}
		println("Old passwords do not match")
		return false
	}
	
	func newPasswordsMatch() -> Bool
	{
		//Compares new passwords
		if newPasswordTextField.text == confirmPasswordTextField.text
		{
			println("New passwords match")
			return true
		}
		else
		{
			println("No new password entered")
		}
		println("New passwords do not match")
		return false
	}
	
	func fieldsComplete() -> Bool
	{
		if newPasswordTextField.text != nil
		{
			if !oldPasswordMatch()
			{
				return false
			}
			if !newPasswordsMatch()
			{
				return false
			}
		}
		return true
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
