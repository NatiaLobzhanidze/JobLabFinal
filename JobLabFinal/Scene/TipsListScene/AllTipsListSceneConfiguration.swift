//
//  AllTipsListSceneConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 11.09.22.
//

import Foundation
enum AllTipsListSceneConfiguration {
    static func configure(with tipsData: [TipsModel]) -> AllTipsListSceneViewController {

        let presenter = AllTipsListScenePresenter()
        let interactor = AllTipsListSceneInteractor(presenter: presenter, passedObject: tipsData)
        let router = AllTipsListSceneRouter(dataStore: interactor)
        let viewController = AllTipsListSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
