//
//  SplashView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Image(Constants.Image.darkBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Image(Constants.Image.splashTitle)
                
                Image(Constants.Image.splash)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                
                Text("SHARE - INSPIRE - CONNECT")
                    .font(.primary(.caption))
                    .foregroundColor(.white)
                
                Button(action: {}) {
                    Text("GET STARTED")
                        .font(.primary(.bodySemibold))
                        .foregroundColor(.white)
                        .padding(.vertical, 16)
                        .padding(.horizontal, 24)
                        .background(
                            Color(
                                uiColor: .init(
                                    red: 208 / 255.0,
                                    green: 208 / 255.0,
                                    blue: 208 / 255.0,
                                    alpha: 0.3
                                )
                            )
                        )
                        .cornerRadius(30)
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
