//
//  MainView.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ArticlesScene.create()
                .navigationDestination(for: Route.self, destination: \.destination)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
