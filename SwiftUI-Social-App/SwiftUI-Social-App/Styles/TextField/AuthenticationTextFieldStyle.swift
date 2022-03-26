//
//  AuthenticationTextFieldStyle.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 24/03/2022.
//

import SwiftUI

struct AuthenticationTextFieldStyle: TextFieldStyle {
    
    let state: AuthenticationTextField.FieldState
    let isFocusing: Bool
    
    init(state: AuthenticationTextField.FieldState = .unfocused, isFocusing: Bool) {
        self.state = state
        self.isFocusing = isFocusing
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.primaryStyle(.body2))
            .padding(.vertical, 16)
            .padding(.horizontal, 24)
            .background(isFocusing ? Color.white : Color.fieldBackground)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
    }
    
    // Border's attributes
    private let borderWidth: CGFloat = 1
    private var borderColor: Color {
        switch state {
        case .unfocused:
            return .clear
        case .focused:
            return .primaryColor
        case .error:
            return .errorColor
        }
    }
}


extension TextFieldStyle where Self == AuthenticationTextFieldStyle {
    
    static func authentication(
        state: AuthenticationTextField.FieldState = .unfocused,
        isFocusing: Bool
    ) -> AuthenticationTextFieldStyle {
        return AuthenticationTextFieldStyle(state: state, isFocusing: isFocusing)
    }
    
}
