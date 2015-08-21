//
//  ProfileSettingsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 8/6/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class ProfileSettingsViewController: UIViewController
{
	@IBOutlet weak var streetAddressTextField: UITextField!
	@IBOutlet weak var statePicker: UIPickerView!
	@IBOutlet weak var zipCodeTextField: UITextField!
	
	@IBAction func saveClicked(sender: UIBarButtonItem)
	{
		//Save the changes and send to database
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		//Retrieve old info from database and display
	}
}
