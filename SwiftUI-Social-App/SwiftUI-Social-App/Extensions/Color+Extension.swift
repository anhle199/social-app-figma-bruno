//
//  Color+Extension.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

extension Color {
    
    static let primaryColor = Color(red: 136 / 255.0, green: 139 / 255.0, blue: 244 / 255.0)
    static let errorColor = Color(red: 233 / 255.0, green: 80 / 255.0, blue: 80 / 255.0)
    
    static let fieldBackground = Color(red: 243 / 255.0, green: 245 / 255.0, blue: 247 / 255.0)
    static let greyBackground = Color(red: 243 / 255.0, green: 245 / 255.0, blue: 247 / 255.0)
    static let primaryBackground = Color(red: 241 / 255.0, green: 241 / 255.0, blue: 254 / 255.0)
    static let overlayBackground = Color(uiColor: .init(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0, alpha: 0.8))
    
    static let greyScale1 = Color(red: 51 / 255.0, green: 51 / 255.0, blue: 51 / 255.0)
    static let greyScale2 = Color(red: 79 / 255.0, green: 79 / 255.0, blue: 79 / 255.0)
    static let greyScale3 = Color(red: 130 / 255.0, green: 130 / 255.0, blue: 130 / 255.0)
    static let greyScale4 = Color(red: 189 / 255.0, green: 189 / 255.0, blue: 189 / 255.0)
    static let greyScale5 = Color(red: 224 / 255.0, green: 224 / 255.0, blue: 224 / 255.0)
    static let greyScale6 = Color(red: 236 / 255.0, green: 237 / 255.0, blue: 238 / 255.0)
    static let greyScale7 = Color(red: 242 / 255.0, green: 242 / 255.0, blue: 242 / 255.0)
    
    static let primaryText = Color(red: 36 / 255.0, green: 36 / 255.0, blue: 36 / 255.0)
    static let secondaryText = Color(red: 130 / 255.0, green: 130 / 255.0, blue: 130 / 255.0)
    static let placeholderText = Color(red: 189 / 255.0, green: 189 / 255.0, blue: 189 / 255.0)
    static let tertiaryText = Color(red: 189 / 255.0, green: 189 / 255.0, blue: 189 / 255.0)
    
    static let regularShadowColor = Color(uiColor: .init(red: 38 / 255.0, green: 41 / 255.0, blue: 43 / 255.0, alpha: 0.07))
    
}

extension View {
    
    func regularShadow() -> some View {
        shadow(color: .regularShadowColor, radius: 0, x: 0, y: 4)
//            .blur(radius: 40)
    }
    
}