//
//  TabBarViewController.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 18.09.22.
//

import UIKit

class TabBarViewController: UIViewController {

    //MARK: UI
    
    private let tabBarVc: UITabBarController = {
        let tb = UITabBarController()
        tb.tabBar.tintColor = .tintColor
        
        return tb
    }()
    var passingData = [String]()
    
//    MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBarController()
    }
    
// MARK: Set up UI
    
    private func createTabBarController() {
        
        let firtsVc = HomeSceneConfiguration.configure(with: passingData)
        firtsVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let secondVc = FavoritesSceneConfiguration.configure()
        secondVc.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        let controllersArray = [firtsVc, secondVc]
        tabBarVc.viewControllers = controllersArray.map{UINavigationController.init(rootViewController: $0)}
        tabBarVc.tabBar.backgroundColor = .white
        tabBarVc.tabBar.shadowedtoView()
        view.addSubview(tabBarVc.view)
    }

}
