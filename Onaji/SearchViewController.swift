//
//  SearchViewController.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController
{
    // prints out all UserInformations that has subject as one of their subjects
    func findTutorWithSubject(subject: String)
    {
        let query = UserInformation.query()!
        query.whereKey("subjects", equalTo: subject)
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil
            {
                if let objects = objects as? [UserInformation]
                {
                    // objects is [UserInformation] that contains corresponding subject
                    for user in objects {
                        println(user.username!)
                        println(user.subjects)
                    }
                }
            }
        }
    }
}
