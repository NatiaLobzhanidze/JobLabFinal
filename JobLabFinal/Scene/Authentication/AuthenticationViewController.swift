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


protocol AuthenticationDisplayLogic: AnyObject
{
    func displaySavedUser(viewModel: Authentication.LoginAction.ViewModel)
}

class AuthenticationViewController: UIViewController
{
  var interactor: AuthenticationBusinessLogic?
  var router: (AuthenticationRoutingLogic & AuthenticationDataPassing)?
    
 
    
    
 //scrollView_ contentview
    
    let scrollView : UIScrollView  = {
        let view = UIScrollView()
        view.isScrollEnabled = true
        return view
    }()
    let contentView = UIView()
    
    // imageView
    let logoImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
        
        return img
    }()
    
    //signin label
    
    let headLineLb: UILabel = {
        let lb = UILabel()
        lb.text = "Sing in to you account"
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.textAlignment = .center
        
        return lb
    }()
  
    ///            2(label+textfields) )
    let emailLb: UILabel = {
        let lb = UILabel()
        lb.addRequiredAsterisk(text: "   Email *")
        lb.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return lb
    }()
    let emailTxFld: UITextField = {
        let txt = UITextField()
       // txt.placeholder = "  Email"
        txt.format()
        txt.shadowedField()
        txt.addPaddingToTextField()
        return txt
    }()
    
    //MARK:  passwords
    let passwordLb: UILabel = {
        let lb = UILabel()
        lb.addRequiredAsterisk(text: "   Password *")
        lb.font = .systemFont(ofSize: 14, weight: .semibold)
        return lb
    }()
    
    let passwordTxFld: UITextField = {
        let txt = UITextField()
        txt.placeholder = " Password"
        txt.format()
        txt.shadowedField()
        txt.addPaddingToTextField()
        return txt
    }()
    
    ///+ signInbutton
    let signInBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Sing in", for: .normal)
        btn.backgroundColor = hexStringToUIColor(hex: "#5180F7")
        btn.heightAnchor.constraint(equalToConstant: 43).isActive = true
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(createUser), for: .touchUpInside)

        return btn
    }()
  
    let orContinueLb: UILabel = {
        let lb = UILabel()
        lb.text = "or continue with"
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 15)
        
        return lb
    }()
    let fbBtn: UIButton = {
        
        let btn = UIButton(type: .custom)
        btn.configureBtn(with: "  FaceBook", image: "fb")
        return btn
        
    }()
    let googleBtn: UIButton = {
        
        let btn = UIButton()
        btn.configureBtn(with: "  Google", image: "32")
        return btn
        
    }()
    let donthaveAn: UILabel = {
        let lb = UILabel()
        lb.text = "Don't have an account?"
        lb.textAlignment = .right
        lb.font = .systemFont(ofSize: 15)
        
        return lb
    }()
    let signUp: UIButton = {
        
        let btn = UIButton()
        btn.addTarget(self, action: #selector(navigateToRegistration), for: .touchUpInside)
        btn.setTitle("SignUp", for: .normal)
        btn.setTitleColor(hexStringToUIColor(hex: "#5180F7"), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15)
  
        
        return btn
        
    }()
    
    
  // MARK: Object lifecycle
    
    init(interactor: AuthenticationBusinessLogic, router: (AuthenticationRoutingLogic & AuthenticationDataPassing)) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

  
  required init?(coder aDecoder: NSCoder)
  {
      fatalError("init(coder:) has not been implemented")


  }
  
  // MARK: Setup
  
  private func setup()
  {
  }
  
  // MARK: Routing
  
    @objc func navigateToRegistration() {
        router?.navigationToRegistration()
    }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
     // view.frame.size.height = 900
      view.backgroundColor = .white
      setUpView()
  
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    @objc func logInButtonAction() {
       guard let email = emailTxFld.text,
             let password = passwordTxFld.text else { return }
        print(password, email)
        
    }
    private func setUpView() {
        let textFieldsArr: [UITextField] = [emailTxFld, passwordTxFld]
        let labelarr: [UILabel]  = [emailLb, passwordLb, headLineLb, orContinueLb, donthaveAn ]
        let btnArr: [UIButton] = [signInBtn,fbBtn, googleBtn, signUp]

        self.addConstreintsToScrollView(scrollView: self.scrollView, contentView: self.contentView)
        self.addConstraintsToImage(contentView: self.contentView, logoImage: self.logoImage)
        self.addHeadLine(contentView: self.contentView, headLineLb: self.headLineLb, logoImage: self.logoImage)
        self.addFirstStackview(textLb: labelarr, textFld: textFieldsArr, btn: btnArr, contentView: self.contentView)
      
     
    }
 @objc func createUser()
  {
      guard let email = emailTxFld.text, let password = passwordTxFld.text else { return }
      let request = Authentication.LoginAction.Request(email: email, password: password)
    interactor?.doSomething(request: request)
      print(email, password)
      filterSheetCall()
    
  }
    
    func filterSheetCall() {
        let filterVC = BottomSheetViewController()
        filterVC.modalPresentationStyle = .custom
      
        filterVC.transitioningDelegate = self
        router?.navigateToSomewhere(destination: filterVC)
      //  self.navigationController?.pushViewController(filterVC, animated: true)
       // self.present(filterVC, animated: true, completion: nil)
    }
 
}

extension AuthenticationViewController : UITextFieldDelegate,  AuthenticationDisplayLogic {
    func displaySavedUser(viewModel: Authentication.LoginAction.ViewModel) {
        print(viewModel.email)
    }
}

extension AuthenticationViewController :  UIViewControllerTransitioningDelegate {
  
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        FilterPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
