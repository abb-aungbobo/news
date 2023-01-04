//
//  NewsApp.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import SwiftUI

@main
struct NewsApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
