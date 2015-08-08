//
//  ViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/21/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit
import Parse

//View class
//Appears only if user is not logged in
//Allow user
class ViewController: UIViewController
{
    @IBOutlet weak var onajiLogo: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
//        Example usage of storing stuff in Parse
//        let testObject = PFObject(className: "TestObject")
//        testObject["foo"] = "bar"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Object has been saved.")
//        }
        
        onajiLogo.image = UIImage(named: "logo")
    }
    
    @IBAction func loginPage()
    {
        // this is to test parallel changes on diff files
        // more testing
    }

}

