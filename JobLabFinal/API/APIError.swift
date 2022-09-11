//
//  APIError.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 10.09.22.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case httpError
    case decodingError
}
