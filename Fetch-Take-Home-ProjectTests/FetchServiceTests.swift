//
//  FetchServiceTests.swift
//  Fetch-Take-Home-ProjectTests
//
//  Created by Dmitry Matveichev on 8/20/24.
//

import XCTest
import Foundation

let mealListJsonData = """
{
    "meals": [
        {
            "strMeal": "Pouding chomeur",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/yqqqwu1511816912.jpg",
            "idMeal": "52932"
        }
    ]
}
"""

let mealDetailsJsonData = """
{
    "meals": [
        {
            "idMeal": "52855",
            "strMeal": "Banana Pancakes",
            "strDrinkAlternate": null,
            "strCategory": "Dessert",
            "strArea": "American",
            "strInstructions": "In a bowl, mash the banana...",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
            "strTags": "Breakfast,Dessert,Sweet",
            "strYoutube": "https://www.youtube.com/watch?v=kSKtb2Sv-_U",
            "strIngredient1": "Banana",
            "strIngredient2": "Eggs",
            "strIngredient3": "Baking Powder",
            "strMeasure1": "1 large",
            "strMeasure2": "2 medium",
            "strMeasure3": "Pinch"
        }
    ]
}
"""


final class FetchServiceTests: XCTestCase {
    var fetchService: FetchService!
    var mockSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        fetchService = FetchService(session: mockSession)
    }
    
    override func tearDown() {
        fetchService = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testFetchMealsSuccess() async throws {
        mockSession.data = mealListJsonData.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: fetchURL.meals.rawValue)!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)
        
        let result = try await fetchService.fetchMeals()
        
        XCTAssertEqual(result.meals.count, 1)

        if let meal = result.meals.first {
            XCTAssertEqual(meal.id, "52932")
            XCTAssertEqual(meal.name, "Pouding chomeur")
            XCTAssertEqual(meal.imageUrl, "https://www.themealdb.com/images/media/meals/yqqqwu1511816912.jpg")
        } else {
            XCTFail("No meals")
        }
    }

    func testFetchMealDetailsValidResponse() async throws {
        mockSession.data = mealDetailsJsonData.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: fetchURL.mealDetails.rawValue + "52855")!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)
        
        let result = try await fetchService.fetchMealDetails(with: "52855")
        
        XCTAssertEqual(result.meals.count, 1)
        if let meal = result.meals.first {
            XCTAssertEqual(meal.id, "52855")
            XCTAssertEqual(meal.name, "Banana Pancakes")
            XCTAssertEqual(meal.instructions, "In a bowl, mash the banana...")
            XCTAssertEqual(meal.ingredients["Banana"], "1 large")
            XCTAssertEqual(meal.ingredients["Eggs"], "2 medium")
            XCTAssertEqual(meal.ingredients["Baking Powder"], "Pinch")
        } else {
            XCTFail("No meal details")
        }
    }
    
// MARK: Error handle cases
    
    func testFetchServiceHandlesInvalidURL() async {
        let invalidURLService = FetchService(session: mockSession)
        mockSession.data = nil
        mockSession.response = nil
        mockSession.error = FetchError.invalidURL

        do {
            _ = try await fetchService.fetchMealDetails(with: "1")
            XCTFail("Expected to throw an error, but did not throw.")
        } catch let error as FetchError {
            XCTAssertEqual(error, FetchError.invalidURL)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

    func testFetchServiceDetailsInvalidResponse() async {
        mockSession.data = mealDetailsJsonData.data(using: .utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: fetchURL.mealDetails.rawValue + "1")!,
                                               statusCode: 404,
                                               httpVersion: nil,
                                               headerFields: nil)
        
        do {
            _ = try await fetchService.fetchMealDetails(with: "1")
            XCTFail("Expected to throw an error, but did not throw.")
        } catch let error as FetchError {
            XCTAssertEqual(error, FetchError.invalidResponse)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }
    
    func testFetchServiceDetailsInvalidData() async {
        let invalidJsonData = "Invalid JSON".data(using: .utf8)
        mockSession.data = invalidJsonData
        mockSession.response = HTTPURLResponse(url: URL(string: fetchURL.mealDetails.rawValue + "1")!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)

        do {
            _ = try await fetchService.fetchMealDetails(with: "1")
            XCTFail("Expected to throw an error, but did not throw.")
        } catch let error as FetchError {
            XCTAssertEqual(error, FetchError.invalidData)
        } catch {
            XCTFail("Unexpected error thrown: \(error)")
        }
    }

}
