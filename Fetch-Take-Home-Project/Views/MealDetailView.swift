//
//  MealDetailView.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import SwiftUI

struct MealDetailView: View {
    @State private var meal: Meal?
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var showAlert = false
    
    var fetchService: FetchServiceProtocol
    var mealId = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                if isLoading {
                    ProgressView("Loading...")
                } else {
                    Text(meal?.name ?? "")
                        .font(.title)
                        .lineLimit(2)
                    CachedAsyncImage(
                        url: URL(string: meal?.imageUrl ?? ""),
                        placeholder: Image("NoImageAvailable")
                    )
                    .frame(width: 250)
                    .cornerRadius(8)
                    Text("Instructions:")
                        .font(.headline)
                        .padding(.top)
                    Text(meal?.instructions ?? "")
                        .multilineTextAlignment(.leading)
                    VStack(alignment: .center, spacing: 5) {
                        Text("Ingredients:")
                            .font(.headline)
                            .padding(.top)
                        if let ingredients = meal?.ingredients {
                            ForEach(Array(ingredients.keys), id: \.self) { ingredient in
                                if let measure = ingredients[ingredient] {
                                    HStack {
                                        Text(ingredient)
                                        Spacer()
                                        Text(measure)
                                    }
                                }
                            }
                        }
                    }
                    Spacer()
                    if let videoUrl = meal?.videoUrl, let url = URL(string: videoUrl) {
                        Link(destination: url, label: {
                            Text("Watch Video")
                                .frame(width: 250, height: 50)
                                .font(.title2)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        })
                    }
                }
            }
            .padding(.horizontal)
        }
        .onAppear(perform: {
            Task {
                await fetchMeal(with: mealId)
            }
        })
    }
    
    private func fetchMeal(with id: String) async {
        do {
            let response = try await fetchService.fetchMealDetails(with: id)
            meal = response.meals.first
            isLoading = false
            showAlert = false
        } catch let error as FetchError {
            errorMessage = error.localizedDescription
            showAlert = true
            isLoading = false
        } catch {
            errorMessage = "An unexpected error while loading Meal details"
            showAlert = true
            isLoading = false
        }
    }
}

#Preview {
    let fetchService = MockFetchService()
    return MealDetailView(fetchService: fetchService, mealId: "52855")
}
