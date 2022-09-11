//
//  TipsModel.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 09.09.22.
//

import Foundation

//struct TipsResponse: Decodable {
//    let tips: [TipsModel]
//}
struct TipsModel: Decodable {
    
    let title, text, author, authorOccupation, cover: String
    
    enum CodingKeys: String, CodingKey {
        case cover = "image_path"
        case text = "story"
        case authorOccupation = "author_occupation"
        case title, author
    }
}
