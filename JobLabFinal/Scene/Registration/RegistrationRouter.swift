//
//  RegistrationRouter.swift
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

protocol RegistrationRoutingLogic {
}

protocol RegistrationDataPassing {
  var dataStore: RegistrationDataStore? { get }
}

final class RegistrationRouter: RegistrationRoutingLogic, RegistrationDataPassing {
  weak var viewController: RegistrationViewController?
  var dataStore: RegistrationDataStore?
}
