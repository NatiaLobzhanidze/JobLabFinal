//
//  RegistrationInteractor.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 03.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit


protocol RegistrationBusinessLogic {
    func createAccount(request: Registration.CreateUser.Request)
    func goToLogInPage(request: Registration.GoToLogIn.Request)
}

protocol RegistrationDataStore {
}

final class RegistrationInteractor:  RegistrationDataStore {
  var presenter: RegistrationPresentationLogic
  var worker: RegistrationWorker
    
    private(set) var isPasswordValid: Bool?
  
  // MARK: Objcet LifeCycle
    
    init(presenter: RegistrationPresentationLogic, worker: RegistrationWorker ) {
        self.presenter = presenter
        self.worker = worker
    }
}
 //MARK: BusinessLogics Methods

extension RegistrationInteractor : RegistrationBusinessLogic {
    func goToLogInPage(request: Registration.GoToLogIn.Request) {
        presenter.goToLogIngPage(response: Registration.GoToLogIn.Response())
    }
    

    func createAccount(request: Registration.CreateUser.Request) {
        
      guard let mail = request.mailTextField.text, let password = request.passwordTexfield.text else {
          presenter.presentFailure(with: AlertMessage.fillFields.rawValue)
                  return }
        
        if  let checkfeldsResult =  worker.checkValidity(email: request.mailTextField, password: request.passwordTexfield, rePassword: request.checkPassword) {
            self.presenter.presentFailure(with: "\(checkfeldsResult)")
        } else {
            worker.createUser(email: mail, password: password, completionBlock: { [weak self] success in
                          if (success) {
                              self?.presenter.presentSuccess(with: AlertMessage.success.rawValue)
                          } else {
                              self?.presenter.presentFailure(with: AlertMessage.problemCreating.rawValue )
                          }
            })
        }
    }
}
