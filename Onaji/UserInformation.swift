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

class UserInformation : PFObject, PFSubclassing
{
    // user information properties
    @NSManaged var user: PFUser
    @NSManaged var friends: [UserInformation]
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var biography: String
    @NSManaged var username: String
    
    
    // instantiates userinformation by setting all properties as blank
    func instantiateUser(user: PFUser)
    {
        self.user = user
        self.username = user.username!
        self.friends = [UserInformation]()
        self.firstName = ""
        self.lastName = ""
        self.biography = ""
        
        self.saveUserInfo()
    }
    
    // saves information of user into parse cloud
    func saveUserInfo() {
        
        self.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                println(self)
                // The object has been saved.
            } else {
                // There was a problem, check error.description
                println(error!.description)
            }
        }
    }
    
//    static func getUserInformation(forUser user: PFUser) -> UserInformation?
//    {
//        let query = UserInformation.query()!
//        query.whereKey("user", equalTo: user)
//        
//        var foundUserInfo : UserInformation
//        
//        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
//            if error == nil {
//                
//                if let objects = objects as? [UserInformation], userInfo = objects.first {
//                    foundUserInfo = userInfo
//                }
//            }
//        }
//        
//        return foundUserInfo
//    }
    
    // adds friends based on username, puts each others UserInformation into respective friends lists
    func addFriend(forUserName username: String)
    {
        let query = UserInformation.query()!
        query.whereKey("username", equalTo: username)
        
        query.findObjectsInBackgroundWithBlock { (objects: [AnyObject]?, error: NSError?) -> Void in
            if error == nil {
                
                if let objects = objects as? [UserInformation], friendUserInfo = objects.first {
                    self.friends.append(friendUserInfo)
                    friendUserInfo.friends.append(self)
                }
            }
        }
    }
    
    static func parseClassName() -> String {
        return "UserInformation"
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
}

