//
//  DataFetchService.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import Foundation

enum fetchURL: String {
    case meals = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
    case mealDetails = "https://themealdb.com/api/json/v1/1/lookup.php?i="
}

extension URLSession: URLSessionProtocol {}

class FetchService: FetchServiceProtocol {
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func fetchMeals() async throws -> MealsListResponse {
        return try await fetchFromUrl(fetchURL.meals.rawValue)
    }
    
    func fetchMealDetails(with id: String) async throws -> MealResponse {
        let urlStr = fetchURL.mealDetails.rawValue + id
        return try await fetchFromUrl(urlStr)
    }

    private func fetchFromUrl<T: Codable>(_ urlStr: String) async throws -> T {
        guard let url = URL(string: urlStr) else {
            throw FetchError.invalidURL
        }
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.invalidResponse
        }

        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            throw FetchError.invalidData
        }
    }
}

enum FetchError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid Response."
        case .invalidData:
            return "Invalid JSON Data."
        }
    }
}
