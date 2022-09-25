//
//  AuthenticationViewController.swift
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


protocol AuthenticationDisplayLogic: AnyObject {
    func displayLogIngSuccess()
    func displayLogInFailure(message: String)
    func displayRegistration(viewModel: Authentication.GoRegisterScene.ViewModel)
}

final class AuthenticationViewController:  BaseViewController {
    
    //MARK: Clean Components
    
  var interactor: AuthenticationBusinessLogic?
  var router: (AuthenticationRoutingLogic & AuthenticationDataPassing)?
    

  // MARK: Object lifecycle
    
    init(interactor: AuthenticationBusinessLogic, router: (AuthenticationRoutingLogic & AuthenticationDataPassing)) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
      super.viewDidLoad()
        setUpView()
    }

  // MARK: @objc Methods
  
    @objc func goToRegistration() {
     
        interactor?.getRegistrationScene(request: Authentication.GoRegisterScene.Request())
    }
    @objc func tryLogin() {
         interactor?.tryLogIn(request: Authentication.LoginAction.Request(mailTextField: emailTxFld, passwordTexfield: passwordTxFld))
     }
    
  // MARK: set up UI
    
    private func setUpView() {
        setUpBaseVcUI()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        let textFieldsArr: [UITextField] = [emailTxFld, passwordTxFld]
        let labelarr: [UILabel]  = [emailLb, passwordLb, headLineLb, orContinueLb, donthaveAn ]
        let btnArr: [UIButton] = [mainBtn,fbBtn, googleBtn, bottomBtn]
        let scrollView = UIScrollView()
            scrollView.isScrollEnabled = true
        let contentView = UIView()
        self.addConstreintsToScrollView(scrollView: scrollView, contentView: contentView)
        self.addConstraintsToImage(contentView: contentView, logoImage: self.logoImage)
        self.addHeadLine(contentView: contentView, headLineLb: self.headLineLb, logoImage: self.logoImage)
        self.addFirstStackview(textLb: labelarr, textFld: textFieldsArr, btn: btnArr, contentView: contentView)
    }
    private func setUpBaseVcUI() {
        mainBtn.setTitle("Log in", for: .normal)
        bottomBtn.addTarget(self, action: #selector(goToRegistration), for: .touchUpInside)
        mainBtn.addTarget(self, action: #selector(tryLogin), for: .touchUpInside)
    }
}

//MARK: DisplayLogic Methods

extension AuthenticationViewController :  AuthenticationDisplayLogic {
    
    func displayLogIngSuccess() {
        router?.navigateToCategoriesScene()
    }
    
    func displayLogInFailure(message: String) {
        self.showAlert(alertText: "Eroor while log in", alertMessage: message, addActionTitle: "Ok")
    }

    func displayRegistration(viewModel: Authentication.GoRegisterScene.ViewModel) {
        router?.navigationToRegistration()
    }
}


