//
//  TipsDetailsConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 11.09.22.
//

import Foundation
enum TipsDetailsSceneConfiguration {
    static func configure(with selectedTip: TipsModel) -> TipsDetailsSceneViewController {
        let presenter = TipsDetailsScenePresenter()

        let interactor = TipsDetailsSceneInteractor(presenter: presenter, selectedTip: selectedTip)
        let router = TipsDetailsSceneRouter(dataStore: interactor)
        let viewController = TipsDetailsSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
