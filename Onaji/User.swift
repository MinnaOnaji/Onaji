//
//  File.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import Foundation
//import Keychain Matthew Li how does this work?

class User
{
    var username: String
    var password: String
    
    //Implement other settings here
    
    init(myUsername: String, myPassword: String)
    {
        username = myUsername
        password = myPassword
    }
}