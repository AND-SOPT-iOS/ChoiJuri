//
//  TabBarController.swift
//  AND-SOPT-35-Seminar
//
//  Created by 최주리 on 11/3/24.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let network = UINavigationController(rootViewController: NetworkMainViewController())
    private let app = UINavigationController(rootViewController: AppViewController())
    private let search = UINavigationController(rootViewController: SearchViewController())
    
    override func viewDidLoad() {
        network.tabBarItem = UITabBarItem(title: "네트워크", image: UIImage(systemName: "globe"), tag: 0)
        app.tabBarItem = UITabBarItem(title: "앱스토어", image: UIImage(systemName: "apple.logo"), tag: 1)
        search.tabBarItem = UITabBarItem(title: "앱스토어", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        viewControllers = [network, app, search]
    }
}
