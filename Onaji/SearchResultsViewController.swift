//
//  SearchResultsViewController.swift
//  Onaji
//
//  Created by Winston Wang on 9/1/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController
{
	var filteredTutors = [UserInformation]()
	
	@IBOutlet weak var searchedStringLabel: UILabel!
	
	@IBOutlet weak var searchResultsTable: UITableView!
	
	var searchStringDelegate: sendSearchStringDelegate?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		if let searchedString = searchStringDelegate?.getString()!
		{
			searchedStringLabel.text = searchedString
			filterContentForSearchText(searchedString)
		}
		else
		{
			print("no search text")
		}
		
		print("filtered tutors: \(filteredTutors)")
	}
	
	// prints out all UserInformations that has subject as one of their subjects
	func findTutorWithSubject(subject: String) -> [UserInformation]
	{
		let query = UserInformation.query()!
		query.whereKey("subjects", equalTo: subject)
		var result = [UserInformation]()
		
		query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
			if error == nil
			{
				if let objects = objects as? [UserInformation]
				{
					// objects is [UserInformation] that contains corresponding subject
					for user in objects {
						print(user.username!)
						print(user.subjects)
						result.append(user)
					}
				}
			}
		}
		
		print(result)
		return result
	}
	
	func filterContentForSearchText(searchText: String)
	{
		filteredTutors = findTutorWithSubject(searchText)
	}
}

protocol sendSearchStringDelegate
{
	func getString() -> String?
}
