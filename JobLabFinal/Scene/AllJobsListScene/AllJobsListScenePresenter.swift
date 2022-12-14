//
//  AllJobsListScenePresenter.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AllJobsListScenePresentationLogic {
    func presentAllJobs(response: AllJobsListScene.GetAllJobs.Response)
    func presentFilteredJobs(response: HomeScene.FilterJobs.Response)
    func presentJobDetails(response: AllJobsListScene.SeeJobDetails.Response)
}

class AllJobsListScenePresenter: AllJobsListScenePresentationLogic {
  weak var viewController: AllJobsListSceneDisplayLogic?

    // MARK: PresentationLogic Protocol Methods

    func presentAllJobs(response: AllJobsListScene.GetAllJobs.Response) {

        let viewModel = AllJobsListScene.GetAllJobs.ViewModel(data: response.data)
        viewController?.displayJobsList(viewModel: viewModel)
    }

    func presentFilteredJobs(response: HomeScene.FilterJobs.Response) {
        let viewModel = response.data
        viewController?.displayFilteredJobs(viewModel: AllJobsListScene.FilterJobs.ViewModel(data: viewModel))
    }
    func presentJobDetails(response: AllJobsListScene.SeeJobDetails.Response) {
        viewController?.displayJobDetailsScene(viewModel: AllJobsListScene.SeeJobDetails.ViewModel())
    }

}
