//
//  PreliminarySettingsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 8/6/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit
import Parse

class PreliminarySettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var birthdayPicker: UIDatePicker!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var streetAddressTextField: UITextField!
	@IBOutlet weak var statePicker: UIPickerView!
	@IBOutlet weak var zipCodeTextField: UITextField!
	
	var selectedState: String?
	
	let pickerData = ["Select one","Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
	
	@IBAction func saveClicked(sender: UIButton)
	{
		// Checks to see if there is missing info, then saves
		if firstNameTextField != nil && lastNameTextField != nil && emailTextField != nil && streetAddressTextField != nil && selectedState != nil && zipCodeTextField != nil && selectedState != pickerData[0]
		{
			save()
			self.performSegueWithIdentifier("preliminarySave", sender:self)
		}
		else
		{
			print("Some fields incomplete")
		}
	}
	
	func save()
	{
		if let user = UserInformation.currentUser()
		{
            user.firstName = self.firstNameTextField.text!
			user.lastName = self.lastNameTextField.text!
			user.email = self.emailTextField.text!
			user.address = self.streetAddressTextField.text!
			user.homeState = self.selectedState!
			user.zipCode = self.zipCodeTextField.text!
		}
		else
		{
			print("No one logged in")
		}
		//Saves to the database
		UserInformation.currentUser()!.saveInBackgroundWithBlock {(success: Bool, error: NSError?)-> Void in
			if let error = error
			{
				// Show the errorString somewhere and let the user try again.
				_ = error.userInfo["error"] as? NSString
				print(error)
			}
			else
			{
				print("saved")
				print(UserInformation.currentUser())
			}
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
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!?
	{
		return pickerData[row]
	}
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
	{
		selectedState = pickerData[row]
	}
    
    //MARK: - Keyboard stuff
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let _ = touches.first
		{
            self.view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
