//
//  AllTipsListSceneModels.swift
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

enum AllTipsListScene
{
  // MARK: Use cases
  
  enum ShowAllTipsList
  {
    struct Request
    {
    }
    struct Response
    {
        var data: [TipsModel]
    }
    struct ViewModel
    {
        var data: [TipsModel]
    }
  }
    enum SeeDetails {
        struct Request
        {
            var data: TipsModel
        }
        struct Response
        {
          
        }
        struct ViewModel
        {
            var data: TipsModel
        }
    }
}
