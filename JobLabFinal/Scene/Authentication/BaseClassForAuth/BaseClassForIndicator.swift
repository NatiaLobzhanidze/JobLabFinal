//
//  BaseClassForIndicator.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 19.09.22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    //MARK: UI
    
    let logoImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "logo")
        
        return img
    }()
    
    let headLineLb: UILabel = {
        let lb = UILabel()
        lb.text = "Sing in to you account"
        lb.font = .systemFont(ofSize: 20, weight: .semibold)
        lb.textAlignment = .center
        
        return lb
    }()
  
    let emailLb: UILabel = {
        let lb = UILabel()
        lb.addRequiredAsterisk(text: TextFieldsTitles.emailAsterisk.rawValue)
        lb.font = .systemFont(ofSize: 14, weight: .semibold)
        
        return lb
    }()
    
    let emailTxFld: UITextField = {
        let txt = UITextField()
        txt.placeholder =  TextFieldsTitles.email.rawValue
        txt.format()
        txt.shadowedField()
        txt.addPaddingToTextField()
        return txt
    }()
    
    let passwordLb: UILabel = {
        let lb = UILabel()
        lb.addRequiredAsterisk(text: TextFieldsTitles.passwordAsterisk.rawValue)
        lb.font = .systemFont(ofSize: 14, weight: .semibold)
        return lb
    }()
    
    let passwordTxFld: UITextField = {
        let txt = UITextField()
        txt.placeholder = TextFieldsTitles.password.rawValue
        txt.format()
        txt.shadowedField()
        txt.addPaddingToTextField()
        txt.isSecureTextEntry = true
        return txt
    }()

    let mainBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = hexStringToUIColor(hex: "#5180F7")
        btn.heightAnchor.constraint(equalToConstant: 43).isActive = true
        btn.layer.cornerRadius = 20

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
        btn.configureBtn(with: "  FaceBook", image: "20")
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
    
    let bottomBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("SignUp", for: .normal)
        btn.setTitleColor(hexStringToUIColor(hex: "#5180F7"), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15)
    
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
