//
//  FavoritesSceneConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 18.09.22.
//

import Foundation
enum FavoritesSceneConfiguration {
    static func configure() -> FavoritesSceneViewController {
        let coreData = CoreDataManaager.shared
        let worker = FavoritesSceneWorker(coreDataManager: coreData)
        let presenter = FavoritesScenePresenter()
        let interactor = FavoritesSceneInteractor(presenter: presenter, worker: worker)
        let router = FavoritesSceneRouter(dataStore: interactor)
        let viewController = FavoritesSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
