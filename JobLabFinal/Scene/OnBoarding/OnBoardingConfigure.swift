//
//  OnBoardingConfigure.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 31.08.22.
//

import Foundation

enum OnBoardingConfiguration {
   static func configure() -> OnBoardingViewController {
        let presenter =  OnBoardingPresenter()
        let worker = OnBoardingWorker()
        let interacotr = OnBoardingInteractor(presenter: presenter, worker: worker)
        let router = OnBoardingRouter(dataStore: interacotr)
        let viewController = OnBoardingViewController(interactor: interacotr, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }

}
