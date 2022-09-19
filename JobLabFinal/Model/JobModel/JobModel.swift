//
//  JobModel.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 08.09.22.
//

import Foundation


struct JobModel: Codable {
    
    let logoImage: String
    let brand : String
    let jobTitle: String
    let location: String
    let jobType: String
    let category: String
    let sallary: Int
}

struct FavJobModeL: Codable {
    var logoImage: String
    var brand: String
    var jobTitle: String
}
