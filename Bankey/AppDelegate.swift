//
//  AppDelegate.swift
//  Bakey
//
//  Created by Ricardo Sanchez on 18/4/22.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    let loginVC = LoginViewController()
    let onboardingContainerVC = OnboardingContainerViewController()
    let dummyVC = DummyViewController()
    let mainVC = MainViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginVC.delegate = self
        onboardingContainerVC.delegate = self
        dummyVC.loguotDelegate = self

//        window?.rootViewController = mainVC
        window?.rootViewController = AccountSummaryViewController()
        return true
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocaleState.hasOnboarded = true
        setRootViewController(dummyVC)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocaleState.hasOnboarded {
            setRootViewController(dummyVC)
        } else {
        setRootViewController(onboardingContainerVC)
        }
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginVC)
    }
}
