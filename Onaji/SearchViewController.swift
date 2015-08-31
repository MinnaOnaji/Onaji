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
    func findTutorWithSubject(subject: String)
    {
        let query = UserInformation.query()!
        query.whereKey("subjects", equalTo: subject)
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil
            {
                if let objects = objects as? [UserInformation]
                {
                    for user in objects {
                        println(user.username!)
                        println(user.subjects)
                    }
                }
            }
        }
    }
}
