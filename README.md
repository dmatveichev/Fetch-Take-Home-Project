# Fetch-Take-Home-Project
Hi!

This is my Take Home Project for Fetch Inc.
I don't have much SwiftUI experience, but I tried my best to show my enthusiasm in learning SwiftUI, right away.

It includes 2 screens:
- MealListView (which fetching data from resource 1) also using MealListViewCell and CachedAsyncImage (View)
- MealDetailView (fetching meal detals from resource 2) using only CachedAsyncImage (View)
Fetch data:
- DataFetchService (fetching data from Server for both resources, using Generic type to avoid code duplication)
- MockFetchService (used to mock FetchService for preview generation)
Objects:
- MealListItem (struct) - used for presenting List Items
- Meal (struct) - used to present Meal Details
Protocols:
- FetchServiceProtocol - used to define protocol for FetchService
Mocks:
- MockURLSession - used to mock URLSession for Unit Tests
- MockFetchService - used for SwiftUI preview (Meal Details)

Unit Tests:
- FetchServiceTests - test Valid cases JSON data for List View and Meal Detals data and also include invalid cases tests.

Thanks for looking at my project. Appreciate your time!
Best Regars,
Dmitry M.
