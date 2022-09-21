//
//  File.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 21.09.22.
//

import Foundation

struct CommonModel: Decodable {
    let jobs: [JobModel]
    let tips: [TipsModel]
}
