//
//  BackButton.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 26/03/2022.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button(action: { dismiss() }) {
            Image(systemName: "chevron.backward")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.primaryColor)
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .frame(width: 40, height: 40)
                .background(Color.primaryBackground)
                .cornerRadius(8)
                .shadow(color: .primaryColor, radius: 0.5, x: 0, y: 0)
        }
    }
    
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Custom back button")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        BackButton()
                    }
                }
        }
        .navigationViewStyle(.stack)
    }
}
