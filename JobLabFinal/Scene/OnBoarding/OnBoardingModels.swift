//
//  OnBoardingModels.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 31.08.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum OnBoarding {
  // MARK: Use cases
  
  enum GetOnBoardingData {
    struct Request {}
    struct Response {
        let data: [OnBoardingModel]
    }
    struct ViewModel {
        let tableData: [OnBoardingModel]
    }
  }
    enum GoToLogInScecen {
      struct Request {
      }
      struct Response {
      }
      struct ViewModel {
      }
    }
}
