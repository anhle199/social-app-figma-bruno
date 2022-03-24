//
//  SplashView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

struct SplashView: View {
    
    @State private var showLoginView = false
    
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
                    .font(.primaryStyle(.caption))
                    .foregroundColor(.white)
                
                Button {
                    showLoginView.toggle()
                } label: {
                    Text("GET STARTED")
                        .font(.primaryStyle(.bodySemibold))
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
            .fullScreenCover(isPresented: $showLoginView) {
                LoginView()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
