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

extension MealListItem {
    static var previewItems: [MealListItem] {
        return [MealListItem(id: "52891", name: "Blackberry Fool", imageUrl: "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg"),
                MealListItem(id: "52788", name: "Christmas Pudding Flapjack", imageUrl: "https://www.themealdb.com/images/media/meals/vvusxs1483907034.jpg"),
                MealListItem(id: "52891", name: "Blackberry Fool", imageUrl: "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg"),
                MealListItem(id: "52788", name: "Christmas Pudding Flapjack", imageUrl: "https://www.themealdb.com/images/media/meals/vvusxs1483907034.jpg"),
                MealListItem(id: "52891", name: "Blackberry Fool", imageUrl: "https://www.themealdb.com/images/media/meals/rpvptu1511641092.jpg"),
                MealListItem(id: "52788", name: "Christmas Pudding Flapjack", imageUrl: "https://www.themealdb.com/images/media/meals/vvusxs1483907034.jpg")]
    }
}
