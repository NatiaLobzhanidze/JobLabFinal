//
//  TipsDetailsSceneRouter.swift
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

@objc protocol TipsDetailsSceneRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol TipsDetailsSceneDataPassing
{
  var dataStore: TipsDetailsSceneDataStore? { get }
}

class TipsDetailsSceneRouter: NSObject, TipsDetailsSceneRoutingLogic, TipsDetailsSceneDataPassing
{
  weak var viewController: TipsDetailsSceneViewController?
  var dataStore: TipsDetailsSceneDataStore?
  
  // MARK: Routing
    init(dataStore: TipsDetailsSceneDataStore) {
        self.dataStore = dataStore
    }

}
