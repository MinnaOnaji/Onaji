//
//  SearchViewController.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchDisplayDelegate
{
    var filteredTutors = [UserInformation]()
    
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
                        println(user.username!)
                        println(user.subjects)
                        result.append(user)
                    }
                }
            }
        }
        
        println(result)
        return result
    }
    
    func filterContentForSearchText(searchText: String)
    {
        filteredTutors = findTutorWithSubject(searchText)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        performSegueWithIdentifier("search", sender: searchBar)
    }
    
    
}
