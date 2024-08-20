//
//  Fetch_Take_Home_ProjectApp.swift
//  Fetch-Take-Home-Project
//
//  Created by Dmitry Matveichev on 8/16/24.
//

import SwiftUI

@main
struct Fetch_Take_Home_ProjectApp: App {
    var body: some Scene {
        WindowGroup {
            let fetchService = FetchService()
            MealsListView(fetchService: fetchService)
        }
    }
}
