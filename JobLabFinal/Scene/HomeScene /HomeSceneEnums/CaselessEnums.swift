//
//  CaselessEnums.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 21.09.22.
//

import UIKit

enum HomeTableViewCellItems: Int {
    case seeAllJob = 0
    case tips = 1
    case seeAllTips = 2
    case filters = 3
    case jobs = 4

    init(section: Int) {
        self = HomeTableViewCellItems(rawValue: section) ?? .seeAllJob
    }

    var title: String {
        switch self {

        case .seeAllJob:
            return "Job Remcomandations"
        case .seeAllTips:
            return "Tips for you"
        default:
            return ""
    }
    }

    var cellHeight: CGFloat {
        switch self {
        case .tips:
            return 200
        case .filters:
            return 60
        case .jobs:
            return 120
        default:
            return 30
        }
    }
}
