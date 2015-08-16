//
//  AccountController.swift
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class AccountController: UITableViewController {
	@IBOutlet weak var usernameLabel: UILabel!
}

extension AccountController {
	//MARK: Initialization
	override func viewWillAppear(animated: Bool) {
		usernameLabel.text = PFUser.currentUser()?.username
	}
}

extension AccountController: UITableViewDelegate {
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		switch indexPath.section {
		case 1:
			switch indexPath.row {
			case 0:
				performLogout()
			case 1:
				deleteAccount()
			default:
				print()
			}
		default:
			print()
		}
	}
	
	//MARK: Logout
	func performLogout() {
		//Perform Logout
		PFUser.logOutInBackgroundWithBlock({ (error) -> Void in
			if error == nil {
				self.view.window?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LoginController") as! LoginController
				return
			}
			println("Error: \(error) \(error?.userInfo)")
			UIAlertView(title: "Something went wrong", message: "There was a problem logging you out right now. Please try again later.", delegate: nil, cancelButtonTitle: "No Problem").show()
		})
	}
	
	//MARK: Delete Users
	func deleteAccount() {
		//Delete Account
		PFUser.currentUser()?.removeObjectForKey("Username")
		PFUser.currentUser()?.removeObjectForKey("Password")
		PFUser.currentUser()?.saveInBackgroundWithBlock({ (success, error) -> Void in
			//					println("\(success) \(error)")
			if success {
				self.performLogout()
				return
			}
			println("Error: \(error) \(error?.userInfo)")
			UIAlertView(title: "Something went wrong", message: "There was a problem deleting your account right now. Please try again later.", delegate: nil, cancelButtonTitle: "No Problem").show()
		})
	}
}
