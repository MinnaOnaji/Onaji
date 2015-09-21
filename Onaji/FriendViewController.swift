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
	@IBOutlet weak var friendTableView: UITableView!
	
	var items: [String] = ["1", "2", "3", "4", "5"]
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		self.friendTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "friends")
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.items.count;
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	{
		let cell:UITableViewCell = self.friendTableView.dequeueReusableCellWithIdentifier("friends")!
		
		cell.textLabel?.text = self.items[indexPath.row]
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
	{
		print("You selected cell #\(indexPath.row)!")
	}
	
//    var friends = [[User]]()
    //retrieve friends from database
    
	//get list of friends
//    func createFriendCells(users_friends: [User])
//    {
//        for friend in users_friends
//        {
//            //let profile_picture = friend.picture
//            let username = friend.username
//            let name = friend.firstName + " " + friend.lastName
//            let friendBio = friend.bio
//            
//            //implementation to create unique cell
//            //add to table
//        }
//    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let dequeued: AnyObject = tableView.dequeueReusableCellWithIdentifier("home", forIndexPath: indexPath)
//        let cell = dequeued as! FriendTableViewCell
//        
//        let currentFriend = friends[indexPath.section][indexPath.row]
//        
//        cell.friendFullName.text = currentFriend.firstName + " " + currentFriend.lastName
//        cell.friendBio.text = currentFriend.bio
//        
//        return cell
//    }
 
    //display cells
}
