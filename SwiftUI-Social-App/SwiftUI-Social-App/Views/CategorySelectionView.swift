//
//  CategorySelectionView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 27/03/2022.
//

import SwiftUI

struct CategorySelectionView: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Image(Constants.Image.headerBackground)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Image(Constants.Image.splashTitle)
                    .offset(x: 0, y: 24)
            }
            .edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 40) {
                Text("Who are you?")
                    .font(.primaryStyle(.title1))
                    .foregroundColor(.primaryText)
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20),
                    ],
                    spacing: 20
                ) {
                    ForEach(
                        Constants.Image.Category.allCases,
                        id: \.self
                    ) { category in
                        ZStack(alignment: .bottom) {
                            Image(category.imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                            
                            Text(category.title)
                                .font(.primaryStyle(.title2))
                                .foregroundColor(.white)
                                .shadow(color: .black, radius: 1, x: 1, y: 0)
                                .padding(.bottom, 24)
                        }
                    }
                }
                
                Text("SHARE - INSPIRE - CONNECT")
                    .font(.primaryStyle(.caption))
                    .foregroundColor(.primaryColor)
                
                Button(action: {}) {
                    Text("EXPLORE NOW")
                        .font(.primaryStyle(.bodySemibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                        .background(Color.primaryLinearGradientColor)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
        }
    }
}

struct CategorySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CategorySelectionView()
    }
}
