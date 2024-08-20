//
//  MealListViewCell.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/20/24.
//

import SwiftUI

struct MealListViewCell: View {
    var meal: MealListItem
    
    var body: some View {
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
}
