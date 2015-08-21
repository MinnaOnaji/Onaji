//
//  GeneralSettingsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 8/6/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class GeneralSettingsViewController: UIViewController
{
	@IBOutlet weak var oldPasswordTextField: UITextField!
	@IBOutlet weak var newPasswordTextField: UITextField!
	@IBOutlet weak var confirmPasswordTextField: UITextField!
	@IBOutlet weak var newEmailTextField: UITextField!

	@IBAction func saveClicked(sender: UIBarButtonItem)
	{
		//Checks that old password is correct
		//Checks new and confirm password match
	}
	
	func compareOldPasswords()
	{
		//Checks that old password is correct
	}
	
	func compareNewPasswords()
	{
		//Checks that new and confirm password match
	}
	
	
}
