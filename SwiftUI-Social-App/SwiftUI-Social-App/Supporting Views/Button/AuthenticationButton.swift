//
//  AuthenticationButton.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 24/03/2022.
//

import SwiftUI

struct AuthenticationButton: View {
    
    let title: String
    let action: () -> Void
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.primaryStyle(.bodySemibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .padding(.horizontal, 24)
                .background(Color.primaryLinearGradientColor)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
    
}

struct AuthenticationButton_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationButton("LOG IN", action: {})
            .padding()
    }
}
