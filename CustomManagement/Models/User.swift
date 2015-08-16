//
//  User.swift
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

struct User {
	var username: String = ""
	var password: String = ""
	
	init(username: String, password: String) {
		self.username = username
		self.password = password
	}
	
	func save() {
		NSUserDefaults.standardUserDefaults().setObject(self as? AnyObject, forKey: "me")
		NSUserDefaults.standardUserDefaults().synchronize()
	}
}
