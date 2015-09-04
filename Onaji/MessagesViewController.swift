//
//  MessagesViewController.swift
//  Onaji
//
//  Created by Winston Wang on 7/29/15.
//  Copyright (c) 2015 Same. All rights reserved.
//
//  Shows messages, when tapped goes to a more detailed view of all past messages
//  Probably need a new VC for detailed view
//  Look into other messaging frameworks/APIs
//

import UIKit

class MessagesViewController: UIViewController
{
	@IBOutlet weak var messageTableView: UITableView!
	
	var items: [String] = ["1", "2", "3", "4", "5"]
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		self.messageTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "messaging")
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		var cell:UITableViewCell = self.messageTableView.dequeueReusableCellWithIdentifier("messaging") as! UITableViewCell
		
		cell.textLabel?.text = self.items[indexPath.row]
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	{
		println("You selected cell #\(indexPath.row)!")
	}
}
