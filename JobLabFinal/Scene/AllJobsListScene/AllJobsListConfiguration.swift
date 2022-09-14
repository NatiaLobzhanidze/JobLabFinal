//
//  AllJobsListConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//

import Foundation

enum AlljobsListControllerConfiguration {
    static func configure(with modelObject: [JobModel]) -> AllJobsListSceneViewController {
        let presenter = AllJobsListScenePresenter()
        let interactor = AllJobsListSceneInteractor(presenter: presenter, myJobModel: modelObject)
        let router = AllJobsListSceneRouter(dataStore: interactor)
        let viewController = AllJobsListSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
