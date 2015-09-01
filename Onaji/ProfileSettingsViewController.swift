//
//  ProfileSettingsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 8/6/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class ProfileSettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
	@IBOutlet weak var streetAddressTextField: UITextField!
	@IBOutlet weak var statePicker: UIPickerView!
	@IBOutlet weak var zipCodeTextField: UITextField!
	
	var selectedState: String?
	
	var pickerData = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
	
	@IBAction func saveClicked()
	{
		//Save the changes and send to database
        println("save clicked")
        UserInformation.currentUser()?.address = streetAddressTextField.text!
        UserInformation.currentUser()?.homeState = selectedState!
        UserInformation.currentUser()?.zipCode = zipCodeTextField.text!
        
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "saveUnwind"
        {
            saveClicked()
        }
    }
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		statePicker.dataSource = self
		statePicker.delegate = self
		
		//Retrieve old info from database and display
		if let address = UserInformation.currentUser()?.address
		{
			streetAddressTextField.text = address
		}
		else
		{
			println("no current address")
		}
		
		if let currentState = UserInformation.currentUser()?.homeState
		{
			for var i = 0; i < pickerData.count; i++
			{
				if pickerData[i] == currentState
				{
					pickerData.removeAtIndex(i)
					break
				}
			}
			pickerData.insert(currentState, atIndex: 0)
			statePicker.selectRow(0, inComponent: 0, animated: true)
            selectedState = currentState
		}
		else
		{
			println("no current state")
		}
		
		if let zipCode = UserInformation.currentUser()?.zipCode
		{
			zipCodeTextField.text = zipCode
		}
		else
		{
			println("no zip code value")
		}
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
        println(selectedState)
	}
    
    //MARK: - Keyboard stuff
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
