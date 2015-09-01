//
//  File.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import Foundation
import UIKit
import Parse

class UserInformation : PFUser, PFSubclassing
{
    // user information properties
    @NSManaged var firstName: String
    @NSManaged var lastName: String
	@NSManaged var birthday: String
	@NSManaged var address: String
	@NSManaged var homeState: String
	@NSManaged var zipCode: String
	@NSManaged var friends: [UserInformation]
    @NSManaged var biography: String
    @NSManaged var subjects: [String]

	
    // adds friends based on username, puts each others UserInformation into respective friends lists
    func addFriend(forUserName username: String)
    {
        let query = UserInformation.query()!
        query.whereKey("username", equalTo: username)
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil
			{
                if let objects = objects as? [UserInformation], friendUserInfo = objects.first
                {
                    
                    var alreadyFriend = false
                    for previousFriend in self.friends
					{
                        if previousFriend.objectId! == friendUserInfo.objectId!
						{
                            alreadyFriend = true
                        }
                    }
                    
                    if alreadyFriend {
                        println("friend is already added")
                    }
                    else
                    {
                        self.friends.append(friendUserInfo)
                        self.save()
                        
                        println(friendUserInfo.username! + " is now " + self.username! + "'s friend.")
                    }
                }
            }
        }
    }
    
    override class func initialize()
	{
        struct Static
		{
            static var onceToken : dispatch_once_t = 0;
        }
		
        dispatch_once(&Static.onceToken)
		{
            self.registerSubclass()
        }
    }
}

