//
//  HomeSceneModels.swift
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

enum HomeScene
{
  // MARK: Use cases
  
  enum GetTips
  {
    struct Request
    {
    }
    struct Response
    {
        let data: [TipsModel]
    }
    struct ViewModel
    {
        let data: [TipsModel]
  
    }
  }
    enum ShowAllTips {
        struct Request
        {
            let data: [TipsModel]
        }
        struct Response
        {
           
        }
        struct ViewModel
        {
      
        }
    }
}
