//
//  TabBarViewController.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 18.09.22.
//

import UIKit

final class TabBarViewController: UIViewController {
    
    //MARK: UI
    
    lazy var blurView: UIView = {
        let v = UIView(frame:
                        CGRect(x: 0, y: 0,
                            width: Int(UIScreen.main.bounds.width),
                            height:  Int(UIScreen.main.bounds.height)))
        v.backgroundColor = .white
        
        return v
    }()
    
    lazy var indicator: UIActivityIndicatorView = {
        let i = UIActivityIndicatorView()
        blurView.addSubview(i)
        i.centerX(inView: blurView)
        i.centerY(inView: blurView)
        i.style = .large
        i.tintColor = .tintColor
        
        return i
    }()
    
    private let tabBarVc: UITabBarController = {
        let tb = UITabBarController()
        tb.tabBar.tintColor = .tintColor
        
        return tb
    }()
    var passingData = [String]()
    
    //    MARK: View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSpiner()
    }
    
    // MARK: Set up UI
    
    private func createTabBarController() {
        let firtsVc = HomeSceneConfiguration.configure(with: passingData)
        firtsVc.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)
        let secondVc = FavoritesSceneConfiguration.configure()
        secondVc.tabBarItem = UITabBarItem.init(title: "Favorites", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        let thirdVc = SettingsSceneConfiguration.configure()
        thirdVc.tabBarItem = UITabBarItem.init(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 2)
        let controllersArray = [firtsVc, secondVc, thirdVc]
        tabBarVc.viewControllers = controllersArray.map{UINavigationController.init(rootViewController: $0)}
        tabBarVc.tabBar.backgroundColor = .white
        tabBarVc.tabBar.shadowedtoView()
        view.addSubview(tabBarVc.view)
    }
    
    private func addSpiner() {
        view.addSubview(blurView)
        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.indicator.stopAnimating()
            self?.createTabBarController()
        }
    }
    
}
