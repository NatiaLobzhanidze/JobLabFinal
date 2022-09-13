//
//  AllJobsListSceneInteractor.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 12.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AllJobsListSceneBusinessLogic
{
    func getAllJobs(request: AllJobsListScene.GetAllJobs.Request)
}

protocol AllJobsListSceneDataStore
{
  var jobModel: [JobModel] { get }
}

class AllJobsListSceneInteractor:  AllJobsListSceneDataStore
{
    //MARK: Clean components
    
  var presenter: AllJobsListScenePresentationLogic?

    var jobModel:  [JobModel]
    
  // MARK: Object LifeCycle
    
    init(presenter: AllJobsListScenePresentationLogic, jobModel:  [JobModel]) {
        self.presenter = presenter
        self.jobModel = jobModel
    }
  

}

extension AllJobsListSceneInteractor: AllJobsListSceneBusinessLogic {
    func getAllJobs(request: AllJobsListScene.GetAllJobs.Request) {
   
        let response = AllJobsListScene.GetAllJobs.Response(data: self.jobModel)
         presenter?.presentAllJobs(response: response)
    }
    
    
}
