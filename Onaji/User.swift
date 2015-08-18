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
import Parse
//import Keychain Matthew Li how does this work?

/*
	
*/
class User
{
    func initiateUserValues(user: PFUser)
    {
        let firstName = ""
        let lastName = ""
        let email = ""
        let bio = ""
        
        user.setObject(firstName, forKey: "FirstName")
        user.setObject(lastName, forKey: "LastName")
        user.setObject(email, forKey: "Email")
        user.setObject(bio, forKey: "Biography")
    }
}

