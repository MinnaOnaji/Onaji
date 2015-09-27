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
	@IBOutlet weak var searchedStringLabel: UILabel!
	
	@IBOutlet weak var searchResultsTable: UITableView!
	
	var searchStringDelegate: sendSearchStringDelegate?
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		if let searchedString = searchStringDelegate?.getString()!
		{
			searchedStringLabel.text = searchedString
		}
		if let searchResults = searchStringDelegate?.getTutors()!
		{
			displayResults(searchResults)
		}
		else
		{
			print("no search text")
		}
	}
	
	func displayResults(tutors: [UserInformation])
	{
		for cell in tutors
		{
			
		}
	}
}

protocol sendSearchStringDelegate
{
	func getString() -> String?
	
	func getTutors() -> [UserInformation]?
}
