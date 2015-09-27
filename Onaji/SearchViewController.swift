//
//  SearchViewController.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, sendSearchStringDelegate
{	
	var searchedString: String!
	
	var filteredTutors = [UserInformation]()
	
	@IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
		if let _ = searchBar.text
		{
			searchedString = searchBar.text
			performSegueWithIdentifier("search", sender: searchBar)
		}
    }

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if segue.identifier == "search"
		{
			let resultsViewController = segue.destinationViewController as! SearchResultsViewController
			resultsViewController.searchStringDelegate = self
			
			filterContentForSearchText(searchedString)
			print("filtered tutors: \(filteredTutors)")
		}
	}
	
	func getString() -> String?
	{
		return searchBar.text
	}
	
	func getTutors() -> [UserInformation]?
	{
		return filteredTutors
	}
	
	@IBAction func returnToSearchPage(segue: UIStoryboardSegue)
	{
		searchBar.text = ""
	}
	
	// prints out all UserInformations that has subject as one of their subjects
	func findTutorWithSubject(subject: String) -> [UserInformation]
	{
		let query = UserInformation.query()!
		query.whereKey("subjects", equalTo: subject)
		var result = [UserInformation]()
		
		result.appendContentsOf((query.findObjects() as? [UserInformation])!)
		
//		query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
//			if error == nil
//			{
//				if let objects = objects as? [UserInformation]
//				{
//					// objects is [UserInformation] that contains corresponding subject
//					for user in objects {
//						print(user.username!)
//						print(user.subjects)
//						result.append(user)
//					}
//				}
//			}
//		}
		
		print(result)
		return result
	}
	
	func filterContentForSearchText(searchText: String)
	{
		filteredTutors = findTutorWithSubject(searchText)
	}
}
