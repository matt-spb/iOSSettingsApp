//
//  AppDelegate.swift
//  iOS3-HW12-Fedyshin Matvey
//
//  Created by matt_spb on 17.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let viewController = ViewController(nibName: nil, bundle: nil)

        let navigationController = UINavigationController(rootViewController: viewController)

        navigationController.navigationBar.prefersLargeTitles = true

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

