//
//  AuthenticationInteractor.swift
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

protocol AuthenticationBusinessLogic
{
    func tryLogIn(request: Authentication.LoginAction.Request)
    func getRegistrationScene(request: Authentication.GoRegisterScene.Request)
}

protocol AuthenticationDataStore
{
  //var name: String { get set }
}

class AuthenticationInteractor:  AuthenticationDataStore
{
  var presenter: AuthenticationPresentationLogic?
  var worker: AuthenticationWorker?
 
    init(presenter: AuthenticationPresentationLogic, worker: AuthenticationWorker ) {
        self.presenter = presenter
        self.worker = worker
    }
  // MARK: Do something
  
    func doSomething(request: Authentication.LoginAction.Request)
  {
    worker = AuthenticationWorker()
 
  }
    private func checkEmail(from mail: String) -> Bool {
      mail.contains( "@" )
    }
}
extension AuthenticationInteractor: AuthenticationBusinessLogic {
    
   func tryLogIn(request: Authentication.LoginAction.Request) {
       guard let mail = request.mailTextField.text,
             let password = request.passwordTexfield.text else
             { return }
        worker?.tryLogIn(email: mail, pass: password, completionBlock: { [weak self] successResult in
            if (successResult) {
                self?.presenter?.presentSuccess()
            } else {
                self?.presenter?.presentFailure(message: "Something went wrong, try again")
            }
        })
    }
    
    
    func getRegistrationScene(request: Authentication.GoRegisterScene.Request) {
        presenter?.presentRegisterScene(response: Authentication.GoRegisterScene.Response())
    }
    
    
}
