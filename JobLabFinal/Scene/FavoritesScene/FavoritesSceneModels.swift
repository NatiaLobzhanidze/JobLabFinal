//
//  FavoritesSceneModels.swift
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

enum FavoritesScene
{
  // MARK: Use cases
  
    enum GetFavoriteJobs
    {
      struct Request
      {
      }
      struct Response
      {
          var data: [JobModel]
      }
      struct ViewModel
      {
          var data: [JobModel]
      }
    }}
