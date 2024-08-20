//
//  RecipeListItem.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import Foundation

struct MealListItem: Codable {
    let id: String
    let name: String
    let imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageUrl = "strMealThumb"
    }
}

struct MealsListResponse: Codable {
    let meals: [MealListItem]
}
