//
//  TipsDetailsSceneInteractor.swift
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

protocol TipsDetailsSceneBusinessLogic {
  func getDetails(request: TipsDetailsScene.Details.Request)
}

protocol TipsDetailsSceneDataStore {
  // var name: String { get set }
}

class TipsDetailsSceneInteractor: TipsDetailsSceneDataStore {
  var presenter: TipsDetailsScenePresentationLogic?
    private(set) var selectedTip: TipsModel

    init(presenter: TipsDetailsScenePresentationLogic, selectedTip: TipsModel) {
        self.presenter = presenter
        self.selectedTip = selectedTip
    }

}
extension TipsDetailsSceneInteractor: TipsDetailsSceneBusinessLogic {
    func getDetails(request: TipsDetailsScene.Details.Request) {

        let response = TipsDetailsScene.Details.Response(tip: selectedTip)
        presenter?.presentDetails(response: response)
    }

}
