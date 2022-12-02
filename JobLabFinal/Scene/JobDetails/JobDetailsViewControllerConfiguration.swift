//
//  JobDetailsViewControllerConfiguration.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 15.09.22.
//

import Foundation
import UIKit

enum JobDetailsViewControllerConfiguration {

    static func configure(with selectedJob: JobModel) -> JobDetailsSceneViewController {
        let presenter = JobDetailsScenePresenter()

        let interactor = JobDetailsSceneInteractor(presenter: presenter, selectedJob: selectedJob)
        let router = JobDetailsSceneRouter(dataStore: interactor)
        let viewController = JobDetailsSceneViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
