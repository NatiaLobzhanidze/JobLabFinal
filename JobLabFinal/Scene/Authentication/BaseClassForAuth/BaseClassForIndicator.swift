//
//  BaseClassForIndicator.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 19.09.22.
//

import Foundation
import UIKit

enum AuthorizationKeys: String {

    case logo = "logo"
    case headLine = "Sing in to your account"
    case mainColor = "#5180F7"
    case orContinue = "or continue with"
    case fbBtn = "Facebook"
    case googleBtn = "Google"
    case dontHave = "Don't have an account?"
    case logIn = "Log In"
    case signUp = "Sign up"
    case doyouHave = "Do you have an account? "
}

class BaseViewController: UIViewController {

    // MARK: UI

    let logoImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: AuthorizationKeys.logo.rawValue)

        return img
    }()

    let headLineLb: UILabel = {
        let lb = UILabel()
        lb.text = AuthorizationKeys.headLine.rawValue
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
        btn.backgroundColor = hexStringToUIColor(hex: AuthorizationKeys.mainColor.rawValue)
        btn.heightAnchor.constraint(equalToConstant: 43).isActive = true
        btn.layer.cornerRadius = 20

        return btn
    }()

    let orContinueLb: UILabel = {
        let lb = UILabel()
        lb.text = AuthorizationKeys.orContinue.rawValue
        lb.textAlignment = .center
        lb.font = .systemFont(ofSize: 15)

        return lb
    }()

    let fbBtn: UIButton = {
        let btn = UIButton(type: .custom)
        let fb = AuthorizationKeys.fbBtn.rawValue
        btn.configureBtn(with: fb, image: fb)
        return btn
    }()
    let googleBtn: UIButton = {
        let btn = UIButton()
        let google = AuthorizationKeys.googleBtn.rawValue
        btn.configureBtn(with: google, image: google)
        return btn
    }()

    let donthaveAn: UILabel = {
        let lb = UILabel()
        lb.text = AuthorizationKeys.dontHave.rawValue
        lb.textAlignment = .right
        lb.font = .systemFont(ofSize: 15)

        return lb
    }()

    let bottomBtn: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(hexStringToUIColor(hex: AuthorizationKeys.mainColor.rawValue), for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 15)

        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: set up view

    func addConstreintsToScrollView(scrollView: UIScrollView, contentView: UIView) {

        self.view.addSubview(scrollView)

        scrollView.anchor(top: self.view.layoutMarginsGuide.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0 )
        scrollView.addSubview(contentView)

        contentView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

    }

    func addConstraintsToImage(contentView: UIView, logoImage: UIImageView) {
        contentView.addSubview(logoImage)
        logoImage.anchor(top: contentView.topAnchor, paddingTop: 0)
        logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1 / 2 ).isActive = true
        logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor, multiplier: 1 / 1.2 ).isActive = true
    }

    func addHeadLine(contentView: UIView, headLineLb: UILabel, logoImage: UIImageView ) {
        contentView.addSubview(headLineLb)
        headLineLb.anchor(top: logoImage.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 30,   paddingRight: 30, height: 30)
    }

    func addStackviews(textLb: [UILabel], textFld: [UITextField], btn: [UIButton], contentView: UIView) {

        // MARK: First StaCkView

        let innerStackview1 = UIStackView(arrangedSubviews: [textLb[0], textFld[0]])
        let innerStackview2 = UIStackView(arrangedSubviews: [textLb[1], textFld[1]])
        innerStackview2.beStackView(axis: .vertical, space: 5, distribution: .equalSpacing)
        innerStackview1.beStackView(axis: .vertical, space: 5, distribution: .equalSpacing)

        let mainStackview = UIStackView(arrangedSubviews: [innerStackview1, innerStackview2])

        if textFld.count > 2 {
        let innerstackview3 = UIStackView(arrangedSubviews: [textLb[5], textFld[2]] )
            innerstackview3.beStackView(axis: .vertical, space: 10, distribution: .equalSpacing)
            mainStackview.addArrangedSubview(innerstackview3)

        }
        mainStackview.addArrangedSubview( btn[0])
        mainStackview.beStackView(axis: .vertical, space: 10, distribution: .equalSpacing)

        contentView.addSubview(mainStackview)
        mainStackview.anchor(top: textLb[2].bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 15, paddingLeft: 30,   paddingRight: 30 )

        // MARK: Second StackView

        let horizontalStackview1 = UIStackView(arrangedSubviews: [btn[1], btn[2]])
        horizontalStackview1.beStackView(axis: .horizontal, space: 10, distribution: .equalSpacing)
        let secondMainStackview = UIStackView(arrangedSubviews: [textLb[3], horizontalStackview1])

        contentView.addSubview(secondMainStackview)
        secondMainStackview.beStackView(axis: .vertical, space: 20, distribution: .equalSpacing)
        secondMainStackview.anchor(top: mainStackview.bottomAnchor, left: contentView.leftAnchor,   right: contentView.rightAnchor, paddingTop: 30, paddingLeft: 30,   paddingRight: 30)

        // MARK: Third StackView

        let thierdStackview = UIStackView(arrangedSubviews: [textLb[4], btn[3]])
        thierdStackview.beStackView(axis: .horizontal, space: 5, distribution: .fillProportionally)

        contentView.addSubview(thierdStackview)
        thierdStackview.anchor(top: secondMainStackview.bottomAnchor, bottom: contentView.bottomAnchor, paddingTop: 40, paddingBottom: 20)
        thierdStackview.centerX(inView: contentView)
    }
}
