//
//  MainTabBarControllerController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 28.11.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavigationController(viewController: FeedViewController(), title: "Feed", image: "circle"),
            createNavigationController(viewController: LogInViewController(), title: "Profile", image: "diamond")
        ]
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundEffect = UIBlurEffect(style: .light)
            appearance.backgroundColor = UIColor(white: 1, alpha: 1)
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    private func createNavigationController(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(systemName: image)
        // Appearence config
        if #available(iOS 15.0, *) {
            let navBar = navigationController.navigationBar
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundEffect = UIBlurEffect(style: .light)
            appearance.backgroundColor = UIColor(white: 1, alpha: 1)
            navBar.standardAppearance = appearance
            navBar.scrollEdgeAppearance = appearance
            return navigationController
        }
    }
}
