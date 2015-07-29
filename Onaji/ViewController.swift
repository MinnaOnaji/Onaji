//
//  ViewController.swift
//  Onaji
//
//  Created by Matthew Li on 7/21/15.
//  Copyright (c) 2015 Same. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var onajiLogo: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        onajiLogo.image = UIImage(named: "logo")
    }
    
    @IBAction func loginPage()
    {
        // this is to test parallel changes on diff files
        // more testing
    }

}

