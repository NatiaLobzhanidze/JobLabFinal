//
//  AuthenticationRouter.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 02.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AuthenticationRoutingLogic {
    func navigationToRegistration()
    func navigateToCategoriesScene()
}

protocol AuthenticationDataPassing {
  var dataStore: AuthenticationDataStore? { get }
}

class AuthenticationRouter: AuthenticationRoutingLogic, AuthenticationDataPassing {
  weak var viewController: AuthenticationViewController?
  var dataStore: AuthenticationDataStore?
    init(dataStore: AuthenticationDataStore ) {
        self.dataStore = dataStore
    }

  // MARK: RoutingLogic Methods
    
    func navigationToRegistration() {
        let vc = RegistrationConfiguration.configure()
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateToCategoriesScene() {
      
        let desttVc = CategoriesSceneConfiguration.configure()
        viewController?.view.window?.rootViewController = desttVc
        viewController?.view.window?.makeKeyAndVisible()
    }
}
