//
//  ContentView.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import SwiftUI

struct MealsListView: View {
    @State private var meals: [RecipeListItem] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var showAlert = false

    let fetchService: FetchServiceProtocol
    
    var body: some View {
        NavigationView {
            if isLoading {
                ProgressView("Loading...")
            } else {
                List(meals, id: \.id) { meal in
                    HStack {
                        CachedAsyncImage(
                            url: URL(string: meal.imageUrl ?? ""),
                            placeholder: Image("NoImageAvailable")
                        )
                        .frame(height: 60)
                        .cornerRadius(4)
                        Text(meal.name)
                            .fontWeight(.regular)
                            .lineLimit(2)
                    }
                }
                .navigationTitle("Desserts")
            }
        }
        .alert("Error", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(errorMessage ?? "Unknown error")
        }
        .onAppear(perform: {
            Task {
                await fetchDesserts()
            }
        })
    }
    
    private func fetchDesserts() async {
        do {
            let response = try await fetchService.fetchDesserts()
            meals = response.meals
            isLoading = false
            showAlert = false
        } catch let error as FetchError {
            errorMessage = error.localizedDescription
            showAlert = true
            isLoading = false
        } catch {
            errorMessage = "An unexpected error while loading data"
            showAlert = true
            isLoading = false
        }
    }
}

#Preview {
    let fetchService = FetchService()
    return MealsListView(fetchService: fetchService)
}
