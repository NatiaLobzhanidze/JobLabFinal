//
//  JobDetailsSceneModels.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 15.09.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum JobDetailsScene {
  // MARK: Use cases

  enum ShowDetails {
    struct Request {
    }
    struct Response {
        let data: JobModel
    }
    struct ViewModel {
        let data: JobModel
    }
  }
    enum Requirements {
        static var requirements = [
            "High School diploma or equivalent",
            "Minumum  3 yers retail sales and/or customer service experience",
            "2 or more years retail supervisory or management experience",
            "Exeptional interpersonal and communication skills, both verval and written",
            "Proven leaderShip skills", "Highly developed problem solving skills",
            "Excellent negotiating and closing skills",
            "Working knowledge of retail systems",
            "Good time management skills and work ethic",
            "The desire to promote an extreme level of excellence and pride in customer service and store detail",
            "Flexibility to work shits, including evenings and weekends, as required"]
    }
}
