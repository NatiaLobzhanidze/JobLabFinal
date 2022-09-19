//
//  CategoriesSceneConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 17.09.22.
//

import Foundation

enum CategoriesSceneConfiguration {
    static func configure() -> CategoriesViewController {
      
        let presenter = CategoriesPresenter()
        let interactor = CategoriesInteractor(presenter: presenter)
        let router = CategoriesRouter(dataStore: interactor)
        let viewController = CategoriesViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
