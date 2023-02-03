//
//  HomeView.swift
//  Rick & Morty App
//
//  Created by Francisco Tomas Nasich on 03/02/2023.
//

import UIKit

class HomeView: UITabBarController {
    
    private let tabBarAppearace = UITabBar.appearance()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBarAppearace.barTintColor = .systemBackground
        tabBar.tintColor = .label
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupViewControllers()
    }
    //MARK: - Helpers
    fileprivate func createTabBar(for rootViewController: UIViewController,
                                  title: String,
                                  image: UIImage) -> UIViewController {
        let viewController = rootViewController
        let tabViewController = UINavigationController(rootViewController: viewController)
        tabViewController.title = title
        tabViewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: nil)
        return tabViewController
    }
    
    private func setupViewControllers() {
        viewControllers = [
            createTabBar(for: MainPageViewController(), title: "Home", image: UIImage(systemName: "house")!),
            createTabBar(for: CharactersListViewController(), title: "Favorites", image: UIImage(systemName: "heart")!),
            createTabBar(for: LocationsListViewController(), title: "Profile", image: UIImage(systemName: "person")!)
        ]
    }
}
