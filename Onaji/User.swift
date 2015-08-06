//
//  File.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

//add more parameters to user, implement parameters in profile page
//save instances of user into server, core data
//prepare for segue
//retrieve instances, display

import Foundation
import UIKit
//import Keychain Matthew Li how does this work?

class User
{
    var username: String
    var password: String
    
    var friends: [User] = []
    //var picture: UIImage = nil
    
    var firstName: String = ""
    var lastName: String = ""
    var bio: String = ""
    
    //Implement other settings here
    
    init(myUsername: String, myPassword: String)
    {
        username = myUsername
        password = myPassword
    }
}