//
//  APIError.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 10.09.22.
//

import Foundation

public enum ApiError: Error {
    case invalidUrl
    case httpError(statusCode: Int)
    case decodingError(_ errorMessage: String?)
    case unknown
}
