//
//  RegistrationViewController.swift
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

protocol RegistrationDisplayLogic: class
{
  func displaySomething(viewModel: Registration.Something.ViewModel)
}

class RegistrationViewController: UIViewController, RegistrationDisplayLogic
{
  var interactor: RegistrationBusinessLogic?
  var router: (RegistrationRoutingLogic & RegistrationDataPassing)?

  // MARK: Object lifecycle
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
           txt.placeholder = "  Email"
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
           txt.placeholder = "  Password"
           txt.format()
           txt.shadowedField()
           txt.addPaddingToTextField()
           return txt
       }()
       
    let repeatePasswordLb: UILabel = {
        let lb = UILabel()
        lb.addRequiredAsterisk(text: "   Repeat Password *")
        lb.font = .systemFont(ofSize: 14, weight: .semibold)
        return lb
    }()
    
    let repeatePasswordtxFld: UITextField = {
        let txt = UITextField()
        txt.placeholder = "  Repeat Password"
        txt.format()
        txt.shadowedField()
        txt.addPaddingToTextField()
        return txt
    }()
       ///+ signInbutton
       let signInBtn: UIButton = {
           let btn = UIButton()
           btn.setTitle("Sing up", for: .normal)
           btn.backgroundColor = hexStringToUIColor(hex: "#5180F7")
           btn.heightAnchor.constraint(equalToConstant: 43).isActive = true
           btn.layer.cornerRadius = 20
   //        btn.widthAnchor.constraint(equalToConstant: 150).isActive = true
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
           lb.text = "Already have an account?"
           lb.textAlignment = .right
           lb.font = .systemFont(ofSize: 15)
         //  lb.widthAnchor.constraint(equalToConstant: 150).isActive = true
           
           return lb
       }()
       let signIn: UIButton = {
           
           let btn = UIButton()
         
           btn.setTitle("Sign in", for: .normal)
           btn.setTitleColor(hexStringToUIColor(hex: "#5180F7"), for: .normal)
           btn.titleLabel?.font = .systemFont(ofSize: 15)
           btn.widthAnchor.constraint(equalToConstant: 60).isActive = true
           
           return btn
           
       }()
       
       
       
     // MARK: Object lifecycle
    
    init(interactor: RegistrationBusinessLogic, router: (RegistrationRoutingLogic & RegistrationDataPassing ) ){
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
     
     // MARK: View lifecycle
     
     override func viewDidLoad()
     {
       super.viewDidLoad()
        // view.frame.size.height = 900
         view.backgroundColor = .white
         setUpView()
       doSomething()
     }
     
     // MARK: Do something
     
     //@IBOutlet weak var nameTextField: UITextField!
     
    private func setUpView() {
        let textFieldsArr: [UITextField] = [emailTxFld, passwordTxFld, repeatePasswordtxFld]
        let labelarr: [UILabel]  = [emailLb,
                                    passwordLb,
                                    headLineLb,
                                    orContinueLb,
                                    donthaveAn,
                                    repeatePasswordLb]
        let btnArr: [UIButton] = [signInBtn,fbBtn, googleBtn, signIn]

        self.addConstreintsToScrollView(scrollView: self.scrollView, contentView: self.contentView)
        self.addConstraintsToImage(contentView: self.contentView, logoImage: self.logoImage)
        self.addHeadLine(contentView: self.contentView, headLineLb: self.headLineLb, logoImage: self.logoImage)
        self.addFirstStackview(textLb: labelarr, textFld: textFieldsArr, btn: btnArr, contentView: self.contentView)
    
     
    }
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = Registration.Something.Request()
   // interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Registration.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
