//
//  HomeSceneRouter.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 07.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

 protocol HomeSceneRoutingLogic {
    func navigateToAllTipsListScene()
    func navigateToDetailsScene()
    func navigateToAllJobsScene()
    func navigateToJobDetailsScene()
}

protocol HomeSceneDataPassing {
    var dataStore: HomeSceneDataStore { get }
}

final class HomeSceneRouter: HomeSceneDataPassing {

    // MARK: Clean components
    weak var viewController: HomeSceneViewController?
    private(set) var dataStore: HomeSceneDataStore

    // MARK: Object Lifecycle

    init(dataStore: HomeSceneDataStore) {
        self.dataStore = dataStore
    }
}

// MARK: Navigation

extension HomeSceneRouter: HomeSceneRoutingLogic {

    func navigateToJobDetailsScene() {
        guard let selectedJob = dataStore.selectedJob else { return }
        let destVc = JobDetailsViewControllerConfiguration.configure(with: selectedJob)
        viewController?.navigationController?.pushViewController(destVc, animated: true)
    }

    func navigateToDetailsScene() {
        guard let selectedTip = dataStore.selectedTip else { return }
        let destVc = TipsDetailsSceneConfiguration.configure(with: selectedTip)
        viewController?.navigationController?.pushViewController(destVc, animated: true)
    }

    func navigateToAllTipsListScene() {
        let passingData = dataStore.passingData
        let destVc = AllTipsListSceneConfiguration.configure(with: passingData)
        viewController?.navigationController?.pushViewController(destVc, animated: true)
    }

    func navigateToAllJobsScene() {
        let destVc = AlljobsListControllerConfiguration.configure(with: dataStore.passingJob)
        viewController?.navigationController?.pushViewController(destVc, animated: true)
    }
}
