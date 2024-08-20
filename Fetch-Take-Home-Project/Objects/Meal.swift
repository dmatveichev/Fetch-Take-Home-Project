//
//  Meal.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import Foundation

struct Meal: Codable {
    let id: String
    let name: String
    let drinkAlternate: String?
    let category: String?
    let area: String?
    let instructions: String?
    let imageUrl: String?
    let tags: String?
    let videoUrl: String?
    let source: String?
    let imageSource: String?
    let creativeCommonsConfirmed: String?
    let dateModified: String?
    
    // Ingredients
    private let strIngredient1: String?
    private let strIngredient2: String?
    private let strIngredient3: String?
    private let strIngredient4: String?
    private let strIngredient5: String?
    private let strIngredient6: String?
    private let strIngredient7: String?
    private let strIngredient8: String?
    private let strIngredient9: String?
    private let strIngredient10: String?
    private let strIngredient11: String?
    private let strIngredient12: String?
    private let strIngredient13: String?
    private let strIngredient14: String?
    private let strIngredient15: String?
    private let strIngredient16: String?
    private let strIngredient17: String?
    private let strIngredient18: String?
    private let strIngredient19: String?
    private let strIngredient20: String?
    
    private let strMeasure1: String?
    private let strMeasure2: String?
    private let strMeasure3: String?
    private let strMeasure4: String?
    private let strMeasure5: String?
    private let strMeasure6: String?
    private let strMeasure7: String?
    private let strMeasure8: String?
    private let strMeasure9: String?
    private let strMeasure10: String?
    private let strMeasure11: String?
    private let strMeasure12: String?
    private let strMeasure13: String?
    private let strMeasure14: String?
    private let strMeasure15: String?
    private let strMeasure16: String?
    private let strMeasure17: String?
    private let strMeasure18: String?
    private let strMeasure19: String?
    private let strMeasure20: String?
        
    var ingredients: [String: String] {
        var result = [String: String]()
        
        let ingredientKeys = [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
            strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
            strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
            strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        ]
        
        let measureKeys = [
            strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
            strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
            strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15,
            strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
        ]
        
        for (ingredient, measure) in zip(ingredientKeys, measureKeys) {
            if let ingredient = ingredient, !ingredient.isEmpty, let measure = measure, !measure.isEmpty {
                result[ingredient] = measure
            }
        }
        
        return result
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case imageUrl = "strMealThumb"
        case tags = "strTags"
        case videoUrl = "strYoutube"
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }
}

struct MealResponse: Codable {
    let meals: [Meal]
}

extension Meal {
    static var preview: Meal {
        Meal(
            id: "52855",
            name: "Banana Pancakes",
            drinkAlternate: "",
            category: "Dessert",
            area: "American",
            instructions: """
                In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder, and vanilla.
                Heat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter,
                spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the
                remaining oil and batter. Top the pancakes with the pecans and raspberries.
                In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.\r\nHeat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter, spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the remaining oil and batter. Top the pancakes with the pecans and raspberries.
                """,
            imageUrl: "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
            tags: "Breakfast,Dessert,Sweet",
            videoUrl: "https://www.youtube.com/watch?v=kSKtb2Sv-_U",
            source: "https://www.bbcgoodfood.com/recipes/banana-pancakes",
            imageSource: "",
            creativeCommonsConfirmed: "",
            dateModified: "",
            strIngredient1: "Banana",
            strIngredient2: "Eggs",
            strIngredient3: "Baking Powder",
            strIngredient4: "Vanilla Extract",
            strIngredient5: "Oil",
            strIngredient6: "Pecan Nuts",
            strIngredient7: "Raspberries",
            strIngredient8: "",
            strIngredient9: "",
            strIngredient10: "",
            strIngredient11: "",
            strIngredient12: "",
            strIngredient13: "",
            strIngredient14: "",
            strIngredient15: "",
            strIngredient16: "",
            strIngredient17: "",
            strIngredient18: "",
            strIngredient19: "",
            strIngredient20: "",
            strMeasure1: "1 large",
            strMeasure2: "2 medium",
            strMeasure3: "Pinch",
            strMeasure4: "Sprinkling",
            strMeasure5: "1 tsp",
            strMeasure6: "25g",
            strMeasure7: "125g",
            strMeasure8: "",
            strMeasure9: "",
            strMeasure10: "",
            strMeasure11: "",
            strMeasure12: "",
            strMeasure13: "",
            strMeasure14: "",
            strMeasure15: "",
            strMeasure16: "",
            strMeasure17: "",
            strMeasure18: "",
            strMeasure19: "",
            strMeasure20: ""
        )
    }
}
