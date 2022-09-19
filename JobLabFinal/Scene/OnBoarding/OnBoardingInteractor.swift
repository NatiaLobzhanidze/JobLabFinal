//
//  OnBoardingInteractor.swift
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

protocol OnBoardingBusinessLogic
{
    func getBanners(request: OnBoarding.GetOnBoardingData.Request)
    func getLogInScene(reequest: OnBoarding.GoToLogInSccen.Request)
}

protocol OnBoardingDataStore
{
    var bannersDataStore: OnBoardingModel? { get }
}

class OnBoardingInteractor: OnBoardingDataStore
{
    //MARK: Clean components
 private var presenter: OnBoardingPresentationLogic?
 private var worker: OnBoardingWorker?
    
    //MARK: properties
    
    var bannersDataStore: OnBoardingModel?
    var banners = [OnBoardingModel]()
    
  //MARK: Object LifeCycle
    
    init(presenter: OnBoardingPresentationLogic, worker: OnBoardingWorker ) {
        self.presenter = presenter
        self.worker = worker
    }
}

// MARK: BusinessLogic Methods

extension OnBoardingInteractor : OnBoardingBusinessLogic {
    func getLogInScene(reequest: OnBoarding.GoToLogInSccen.Request) {
        presenter?.presentLogInScene(response: OnBoarding.GoToLogInSccen.Response())
    }
    
    func getBanners(request: OnBoarding.GetOnBoardingData.Request)
    {
        guard let banners = worker?.getModelArray() else { return}
        self.banners = banners
        self.presenter?.presentBanners(response: OnBoarding.GetOnBoardingData.Response(data: self.banners))
    }
}
