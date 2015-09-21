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
		print("save clicked")
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
				_ = error.userInfo["error"] as? NSString
				print(error)
			}
			else
			{
				print(UserInformation.currentUser())
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
				print("Password correct")
				return true
			}
		}
		else
		{
			print("Old password from database missing")
		}
		print("Old passwords do not match")
		return false
	}
	
	func newPasswordsMatch() -> Bool
	{
		//Compares new passwords
		if newPasswordTextField.text == confirmPasswordTextField.text
		{
			print("New passwords match")
			return true
		}
		else
		{
			print("No new password entered")
		}
		print("New passwords do not match")
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
