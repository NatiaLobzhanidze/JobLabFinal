//
//  JobDetailsScenePresenter.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 15.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol JobDetailsScenePresentationLogic
{
    func presentJobDetails(response: JobDetailsScene.ShowDetails.Response)
}

class JobDetailsScenePresenter: JobDetailsScenePresentationLogic
{
    
  weak var viewController: JobDetailsSceneDisplayLogic?
  
  // MARK: Do PresentationLogics
  
    func presentJobDetails(response: JobDetailsScene.ShowDetails.Response) {
        let viewModel = response.data
        self.viewController?.displayJobDetails(viewModel: JobDetailsScene.ShowDetails.ViewModel(data: viewModel))
    }
}