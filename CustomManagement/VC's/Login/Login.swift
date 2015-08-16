//
//  ViewController.swift
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit
import Parse

class LoginController: UIViewController {
	@IBOutlet weak var UsernameTextfield: UITextField!
	@IBOutlet weak var PasswordTextfield: UITextField!
}

extension LoginController {
	//MARK: Initialization
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		UsernameTextfield.becomeFirstResponder()
	}
}

extension LoginController: UITextFieldDelegate {
	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		if range.location == 0 && string == " " { return false }
		if textField == UsernameTextfield {
			if string == " " {
				return false
			}
		}
		return true
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		switch textField {
		case UsernameTextfield:
			PasswordTextfield.becomeFirstResponder()
		case PasswordTextfield:
			performLoginIfPossible(UsernameTextfield.text, password: textField.text)
		default:
			print()
		}
		return true
	}
}

extension LoginController {
	//MARK: Perform Login
	func performLoginIfPossible(username: String, password: String) {
		PFUser.logInWithUsernameInBackground(username, password: password) { (user, error) -> Void in
			//			println("\(user) \(error)")
			if error == nil {
				self.performSegueWithIdentifier("ToChatList", sender: nil)
				return
			}
			self.performSignup(username, password: password)
		}
	}
	
	//MARK: Sign Up
	func performSignup(username: String, password: String) {
		var newUser = PFUser()
		newUser.username = username
		newUser.password = password
		newUser.signUpInBackgroundWithBlock { (success, error) -> Void in
			//			println("\(success) \(error)")
			if success == true {
				self.performLoginIfPossible(username, password: password)
				return
			}
			println("Error: \(error) \(error?.userInfo)")
			UIAlertView(title: "Something went wrong", message: "Thre was a problem signing you up right now. Please try again later.", delegate: nil, cancelButtonTitle: "No Problem").show()
		}
	}
}

extension LoginController {
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
	}
}