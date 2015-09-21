//
//  HomeTableViewController.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//
//  Show recent posts
//  Posts will contain friend + tutor/tutee + subject learned + date
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	@IBOutlet weak var homeTableView: UITableView!
	
	var items: [String] = ["1", "2", "3", "4", "5"]
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		self.homeTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "home")
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		var cell:UITableViewCell = self.homeTableView.dequeueReusableCellWithIdentifier("home")!
		
		cell.textLabel?.text = self.items[indexPath.row]
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	{
		print("You selected cell #\(indexPath.row)!")
	}
}
