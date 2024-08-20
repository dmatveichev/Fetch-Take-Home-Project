//
//  MockFetchService.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/20/24.
//

import Foundation

class MockFetchService: FetchServiceProtocol {
    func fetchMeals() async throws -> MealsListResponse {
        return MealsListResponse(meals: MealListItem.previewItems)
    }
    
    func fetchMealDetails(with id: String) async throws -> MealResponse {
        return MealResponse(meals: [Meal.preview])
    }
}
