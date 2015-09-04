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
	
	@IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
		if let searchedString = searchBar.text
		{
			performSegueWithIdentifier("search", sender: searchBar)
		}
    }

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
	{
		if segue.identifier == "search"
		{
			var resultsViewController = segue.destinationViewController as! SearchResultsViewController
			resultsViewController.searchStringDelegate = self
		}
	}
	
	func getString() -> String?
	{
		return searchBar.text
	}
	
	@IBAction func returnToSearchPage(segue: UIStoryboardSegue)
	{
		searchBar.text = ""
	}
}
