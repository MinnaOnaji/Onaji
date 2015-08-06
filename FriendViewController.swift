//
//  FriendViewController.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController
{
    //retrieve friends from database
    
	//get list of friends
    func createFriendCells(users_friends: [User])
    {
        for friend in users_friends
        {
            //let profile_picture = friend.picture
            let username = friend.username
            let name = friend.firstName + " " + friend.lastName
            let friendBio = friend.bio
            
            //implementation to create unique cell
            //add to table
        }
    }
    
    //display cells
}
