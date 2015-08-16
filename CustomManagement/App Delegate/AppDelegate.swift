//
//  AppDelegate.swift
//  Chatter
//
//  Created by ArshAulakh on 16/08/15.
//  Copyright (c) 2015 Intelligente Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	//MARK: Application Methods
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		setupParse(launchOptions: launchOptions)
		checkForLoggedInUser()
		return true
	}
	
	//MARK: Setup Parse
	func setupParse(#launchOptions: [NSObject: AnyObject]?) {
		Parse.enableLocalDatastore()
		Parse.setApplicationId(ParseApplicationID, clientKey: ParseClientKey)
	}
	
	//MARK: CheckFor Logged In User
	func checkForLoggedInUser() {
		if let user = PFUser.currentUser() {
			if user.isAuthenticated() {
				if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TabController") as? UITabBarController { window?.rootViewController = controller }
			}
		}
	}
}

extension AppDelegate {
}

extension AppDelegate {
	//MARK: Additional Methods
	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}
	
	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}
	
	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}
	
	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}
	
	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}
}