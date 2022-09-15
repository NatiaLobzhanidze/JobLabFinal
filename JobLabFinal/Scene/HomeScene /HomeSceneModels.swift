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
    enum SeeDetails {
        struct Request
        {
            let tip: TipsModel
           
        }
        struct Response
        {
           
        }
        struct ViewModel
        {
      
        }
    }
    enum ShowAllJobs {
        struct Request
        {
           
        }
        struct Response
        {
            let data: [JobModel]
           
        }
        struct ViewModel
        {
      
        }
    }
    enum Getjobs {
        struct Request
        {
        }
        struct Response
        {
            let data: [JobModel]
        }
        struct ViewModel
        {
            let data: [JobModel]
      
        }
    }
    enum FilterJobs {
        struct Request
        {
            let keyword: String
        }
        struct Response
        {
            let data: [JobModel]
        }
        struct ViewModel
        {
            let data: [JobModel]
      
        }
    }
    enum SeeJobDetails {
        struct Request
        {
            let job: JobModel
           
        }
        struct Response
        {
           
        }
        struct ViewModel
        {
      
        }
    }
}
