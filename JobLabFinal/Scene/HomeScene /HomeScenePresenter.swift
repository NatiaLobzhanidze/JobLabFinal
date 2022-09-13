//
//  HomeScenePresenter.swift
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

protocol HomeScenePresentationLogic
{
  func presentTipsData(response: HomeScene.GetTips.Response)
  func presentAllTips(response: HomeScene.ShowAllTips.Response)
  func presnetTipsDetails(response: HomeScene.SeeDetails.Response)
  func presentAllJobs(response: HomeScene.ShowAllJobs.Response)
  func presentFetchedJobs(response: HomeScene.Getjobs.Response)
}

class HomeScenePresenter
{
  weak var viewController: HomeSceneDisplayLogic?
  
  // MARK: Private Methods
  
}

extension HomeScenePresenter: HomeScenePresentationLogic {
    
    func presentFetchedJobs(response: HomeScene.Getjobs.Response) {
        let viewModel = response.data
        self.viewController?.displayJobs(viewModel: HomeScene.Getjobs.ViewModel(data: viewModel))
    }
    func presentAllJobs(response: HomeScene.ShowAllJobs.Response) {
        viewController?.displayAllJobsScene(viewModel: HomeScene.ShowAllJobs.ViewModel())
    }
    func presnetTipsDetails(response: HomeScene.SeeDetails.Response) {
        viewController?.displayTipDetails(viewModel: HomeScene.SeeDetails.ViewModel())
    }
    
    func presentAllTips(response: HomeScene.ShowAllTips.Response) {
        viewController?.displayAllTipsScene(viewModel: HomeScene.ShowAllTips.ViewModel())
    }
    
    func presentTipsData(response: HomeScene.GetTips.Response)
    {
        let viewModel = response.data
        viewController?.displayTips(viewModel: HomeScene.GetTips.ViewModel(data: viewModel))
    }
    
}
