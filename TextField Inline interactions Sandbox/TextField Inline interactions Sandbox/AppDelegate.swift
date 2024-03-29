//
//  AppDelegate.swift
//  TextField Inline interactions Sandbox
//
//  Created by Yash Shah on 11/05/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.backgroundColor = .systemBackground
		window?.rootViewController = ViewController()
		return true
	}
}

