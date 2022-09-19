//
//  HomeSceneConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 10.09.22.
//

import Foundation
enum HomeSceneConfiguration {
    static func configure(with jobCategory: [String]) -> HomeSceneViewController {
        let apiManager = APIManager()
        let worker = HomeSceneWorker(api: apiManager)
        let presenter = HomeScenePresenter()
        let interactor = HomeSceneInteractor(presenter: presenter, worker: worker, slectedCategories: jobCategory)
        let router = HomeSceneRouter(dataStore: interactor)
        let viewController = HomeSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
