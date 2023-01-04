//
//  ArticleView.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import SwiftUI

struct ArticleView: View {
    let viewModel: ArticleViewModel
    
    var body: some View {
        WebView(url: viewModel.articleURL)
            .edgesIgnoringSafeArea([.leading, .bottom, .trailing])
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleScene.create(article: .fake)
    }
}
