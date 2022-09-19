//
//  AuthenticationPresenter.swift
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

protocol AuthenticationPresentationLogic
{
    func presentSuccess()
    func presentFailure( message: String)
    func presentRegisterScene(response: Authentication.GoRegisterScene.Response)
}

class AuthenticationPresenter: AuthenticationPresentationLogic
{
    func presentSuccess() {
        viewController?.displayLogIngSuccess()
    }
    
    func presentFailure(message: String) {
        viewController?.displayLogInFailure(message: message)
    }
    
  weak var viewController: AuthenticationDisplayLogic?
  
  // MARK: Do something
  
    func presentRegisterScene(response: Authentication.GoRegisterScene.Response)
  {
      viewController?.displayRegistration(viewModel: Authentication.GoRegisterScene.ViewModel())
  }
}
