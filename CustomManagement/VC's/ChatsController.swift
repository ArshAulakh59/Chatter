//
//  ChatsController.swift
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

class ChatsController: UIViewController {
	deinit {
		NSNotificationCenter.defaultCenter().removeObserver(self)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	func setup() {
		NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("authenticationComplete"), name: "AuthenticationCompleted", object: nil)
		LayerAuthenticationHelper.sharedInstance().setupLayer()
	}
	
	func authenticationComplete() {
		let vc = ConversationsController(layerClient: LayerAuthenticationHelper.sharedInstance().layerClient)
		navigationController?.pushViewController(vc, animated: false)
	}
}
