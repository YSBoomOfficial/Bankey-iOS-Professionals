//
//  AppDelegate.swift
//  Bankey
//
//  Created by Yash Shah on 06/01/2022.
//

import UIKit

public let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	let loginViewController = LoginViewController()
	let onboardingContainerViewController = OnboardingContainerViewController()
	let mainViewController = MainViewController()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.makeKeyAndVisible()
		window?.backgroundColor = .systemBackground

		loginViewController.delegate = self
		onboardingContainerViewController.delegate = self

		setRootViewController(loginViewController)

		return true
	}
}

extension AppDelegate {
	func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
		guard animated, let window = window else {
			window?.rootViewController = vc
			window?.makeKeyAndVisible()
			return
		}

		window.rootViewController = vc
		window.makeKeyAndVisible()
		UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
	}

	private func prepMainView() {
		mainViewController.setStatusBar()
		UINavigationBar.appearance().isTranslucent = false
		UINavigationBar.appearance().backgroundColor = appColor
	}

	private func displayNextScreen() {
		if LocalState.hasOnboarded {
			prepMainView()
			setRootViewController(mainViewController)
		} else {
			setRootViewController(onboardingContainerViewController)
		}
	}


}

extension AppDelegate: LoginViewControllerDelegate {
	func didLogin() {
		displayNextScreen()
	}
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
	func didFinishOnboarding() {
		LocalState.hasOnboarded = true
		prepMainView()
		setRootViewController(mainViewController)
	}
}

extension AppDelegate: LogOutDelegate {
	func didLogout() {
		setRootViewController(loginViewController)
	}
}