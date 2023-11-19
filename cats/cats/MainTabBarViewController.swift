//
//  MainTabBarViewController.swift
//  cats
//
//  Created by user on 11/20/23.
//

import UIKit

final class MainTabBarViewController: UITabBarController {

    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarItems()
    }

    // MARK: - Setup Methods

    private func configureTabBarItems() {
        let homeVC = createHomeViewController()
        let breedVC = createBreedViewController()

        setViewControllers([homeVC, breedVC], animated: true)
    }

    // MARK: - Helper Methods

    private func createHomeViewController() -> UINavigationController {
        let homeVC = UINavigationController(rootViewController: MainPageViewController())
        homeVC.tabBarItem.image = UIImage(systemName: TabBarImage.listDash)
        return homeVC
    }

    private func createBreedViewController() -> UINavigationController {
        let breedVC = UINavigationController(rootViewController: BreedViewController())
        breedVC.tabBarItem.image = UIImage(systemName: TabBarImage.cat)
        breedVC.title = "Breeds"
        return breedVC
    }
}

// MARK: - Constants

extension MainTabBarViewController {

    private enum TabBarImage {
        static let listDash = "list.dash"
        static let cat = "cat"
    }
}

