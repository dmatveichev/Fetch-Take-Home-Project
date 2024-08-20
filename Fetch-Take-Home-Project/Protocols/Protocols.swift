//
//  Protocols.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import Foundation

protocol FetchServiceProtocol {
    func fetchMeals() async throws -> MealsListResponse
    func fetchMealDetails(with id: String) async throws -> MealResponse
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}
