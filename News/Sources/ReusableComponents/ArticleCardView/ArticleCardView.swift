//
//  ArticleCardView.swift
//  News
//
//  Created by Aung Bo Bo on 14/04/2022.
//

import SDWebImageSwiftUI
import SwiftUI

struct ArticleCardView: View {
    let viewModel: ArticleCardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            image
            titleAndSubtitle
        }
        .padding(.bottom, 16)
    }
    
    private var image: some View {
        WebImage(url: viewModel.imageURL)
            .resizable()
            .placeholder {
                Rectangle().foregroundColor(.secondary.opacity(0.3))
            }
            .aspectRatio(contentMode: .fill)
    }
    
    private var titleAndSubtitle: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(viewModel.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .lineLimit(nil)
        .multilineTextAlignment(.leading)
        .padding([.horizontal], 16)
    }
}
