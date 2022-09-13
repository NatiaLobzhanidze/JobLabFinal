//
//  AllJobsListSceneRouter.swift
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

@objc protocol AllJobsListSceneRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol AllJobsListSceneDataPassing
{
  var dataStore: AllJobsListSceneDataStore? { get }
}

class AllJobsListSceneRouter: AllJobsListSceneRoutingLogic, AllJobsListSceneDataPassing
{
  weak var viewController: AllJobsListSceneViewController?
  var dataStore: AllJobsListSceneDataStore?
  
    //MARK: object LifeCycle
    init(dataStore: AllJobsListSceneDataStore) {
        self.dataStore = dataStore
    }
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: AllJobsListSceneViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: AllJobsListSceneDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
