//
//  FavoritesScenePresenter.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 18.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FavoritesScenePresentationLogic
{
    func presentFavorites(response: FavoritesScene.GetFavoriteJobs.Response)
}

class FavoritesScenePresenter: FavoritesScenePresentationLogic
{
  weak var viewController: FavoritesSceneDisplayLogic?
  
  // MARK: PresentationLogic Methods
    
    func presentFavorites(response: FavoritesScene.GetFavoriteJobs.Response) {
        
        viewController?.displayFavoriteJobs(viewModel: FavoritesScene.GetFavoriteJobs.ViewModel(data: response.data))
    }
}