//
//  RegistrationConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 05.09.22.
//

import Foundation

enum RegistrationConfiguration  {
    static func configure() -> RegistrationViewController{
        let presenter = RegistrationPresenter()
        let worker = RegistrationWorker()
        let interactor = RegistrationInteractor(presenter: presenter, worker: worker)
        let router = RegistrationRouter()
        let viewController = RegistrationViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
