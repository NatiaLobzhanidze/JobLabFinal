//
//  ConfigurAuthVC.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 05.09.22.
//

import Foundation

enum AuthenticationConfiguration {
    static func configure() -> AuthenticationViewController {
        let presenter = AuthenticationPresenter()
        let worker = AuthenticationWorker()
        let interactor = AuthenticationInteractor(presenter: presenter, worker: worker)
        let router = AuthenticationRouter(dataStore: interactor)
        let viewController = AuthenticationViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
