//
//  AllTipsListScenePresenter.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 11.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AllTipsListScenePresentationLogic {
    func presentAllTipsList(response: AllTipsListScene.ShowAllTipsList.Response)
    func presentTipsDetails(response: AllTipsListScene.SeeDetails.Response)
}

class AllTipsListScenePresenter: AllTipsListScenePresentationLogic {

  weak var viewController: AllTipsListSceneDisplayLogic?

  // MARK: PresentationLogic Protocol Methods

func presentAllTipsList(response: AllTipsListScene.ShowAllTipsList.Response) {

    let viewModel = AllTipsListScene.ShowAllTipsList.ViewModel(data: response.data)

    viewController?.displayAllTipsList(viewModel: viewModel)
  }

func presentTipsDetails(response: AllTipsListScene.SeeDetails.Response) {
    viewController?.displayTipDetailsScene(viewModel: HomeScene.SeeDetails.ViewModel())
    }

}
