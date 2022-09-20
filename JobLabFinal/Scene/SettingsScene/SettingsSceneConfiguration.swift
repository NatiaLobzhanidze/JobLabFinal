//
//  SettingsScene.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 20.09.22.
//

import Foundation

enum SettingsSceneConfiguration {
    static func configure() -> SettingsSceneViewController {
        let presenter = SettingsScenePresenter()
        let interactor = SettingsSceneInteractor(presenter: presenter)
        let router = SettingsSceneRouter(dataStore: interactor)
        let viewController = SettingsSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
