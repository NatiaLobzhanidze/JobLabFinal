//
//  TipsDetailsScenePresenter.swift
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

protocol TipsDetailsScenePresentationLogic {
  func presentDetails(response: TipsDetailsScene.Details.Response)
}

class TipsDetailsScenePresenter: TipsDetailsScenePresentationLogic {
  weak var viewController: TipsDetailsSceneDisplayLogic?

  // MARK: Methods

  func presentDetails(response: TipsDetailsScene.Details.Response) {
      let data = response.tip
    let viewModel = TipsDetailsScene.Details.ViewModel(tipDetails: data)
      viewController?.displayDetails(viewModel: viewModel)
  }
}
