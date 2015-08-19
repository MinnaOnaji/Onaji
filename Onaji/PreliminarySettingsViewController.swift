//
//  PreliminarySettingsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 8/6/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit
import Parse

class PreliminarySettingsViewController: SettingsViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var birthdayPicker: UIDatePicker!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var streetAddressTextField: UITextField!
	@IBOutlet weak var statePicker: UIPickerView!
	@IBOutlet weak var zipCodeTextField: UITextField!
	
	var selectedState: String!
	
	let pickerData = ["Select one","Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
	
	@IBAction func saveClicked(sender: UIButton)
	{
		// Checks to see if there is missing info, then saves
		if firstNameTextField == nil || lastNameTextField == nil || emailTextField == nil || streetAddressTextField == nil || selectedState! == "Select one" || zipCodeTextField == nil
		{
			println("Some fields incomplete")
		}
		else
		{
			save()
		}
	}
	
	func save()
	{
		//Saves to the database
		if let newAccount = PFUser.currentUser()
		{
			newAccount["firstName"] = firstNameTextField.text!
			newAccount["lastName"] = lastNameTextField.text!
			newAccount["email"] = emailTextField.text!
			newAccount["address"] = streetAddressTextField.text!
			newAccount["state"] = selectedState
			newAccount["zipCode"] = zipCodeTextField.text!
		}
		else
		{
			println("No one logged in")
		}
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		statePicker.dataSource = self
		statePicker.delegate = self
	}
	
	//MARK: - Delegates and data sources
	//MARK: Data Sources
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
	{
		return 1
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
	{
		return pickerData.count
	}
	
	//MARK: Delegates
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
	{
		return pickerData[row]
	}
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
	{
		selectedState = pickerData[row]
	}
}
