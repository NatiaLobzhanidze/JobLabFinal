//
//  AuthenticationModels.swift
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
import SwiftUI

enum Authentication {

  // MARK: Use cases

  enum LoginAction {
    struct Request {
        let mailTextField: UITextField
        let passwordTexfield: UITextField
    }
    struct Response {
        let user: User
    }
    struct ViewModel {
        let email: String
        let password: String
        let isVAlid: Bool
    }
  }
    enum GoRegisterScene {
      struct Request {
      }
      struct Response {
      }
      struct ViewModel {
      }
    }
}
