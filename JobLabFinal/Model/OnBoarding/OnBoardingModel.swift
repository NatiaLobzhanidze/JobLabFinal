//
//  OnBoardingModel.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 31.08.22.
//

import Foundation
import UIKit

struct OnBoardingModel {
    let image: UIImage!
    let title: String
}

// MARK: for onBording collectionView cell conf.

enum viewsOnBanner {
    static let jobBanners = [
        "job1-1": "Find job offers from the most popular job listing sites",
        "job2-1": "Track all your job applicatons and don’t get lost in the process",
        "job3-1": "Start appliying and get a Job Now!"
    ]
}
enum OnBorderingBtnTitles: String {
    case next, start, skip
}
