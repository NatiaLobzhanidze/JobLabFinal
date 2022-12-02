//
//  APIManager.swift
//  JobLabFinal
//
//  Created by Natia's Mac on 10.09.22.
//

import Foundation

public final class APIManager {

    public static var shared = APIManager()
    init() {}

    public  func fetchData<T: Decodable>(urlString: String, decodingType: T.Type) async throws -> T {
        let session = URLSession.shared

        guard let url = URL(string: urlString) else {

            throw ApiError.invalidUrl }

        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else { throw ApiError.unknown }

        guard (200...299).contains(httpResponse.statusCode) else {
            throw ApiError.httpError(statusCode: httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(decodingType.self, from: data)
        } catch {
            print(error.localizedDescription)
            throw ApiError.decodingError(error.localizedDescription)

        }
    }
}
