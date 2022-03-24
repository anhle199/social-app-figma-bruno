//
//  SignUpView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 24/03/2022.
//

import SwiftUI

struct SignUpView: View {
    
    // Variables indicate user's registration info
    @State private var nickname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // Environment variable is used to dismiss this view and return to LoginView
    @Environment(\.dismiss) var dismiss
    
    // Variables indicate a specific field's focus state
    @State private var currentFocusedField: AuthenticationTextField.FocusableField? = nil
    @FocusState private var focusedField: AuthenticationTextField.FocusableField?
    private let fields: [AuthenticationTextField.FocusableField] = [
        .nickname(),
        .emailAddress(),
        .password(id: 0),  // password field
        .password(id: 1),  // confirm password field
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(Constants.Image.loginHeader)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.top)
                
                VStack(spacing: 40) {
                    // Sign up form
                    VStack(spacing: 20) {
                        AuthenticationTextField(
                            placeholder: "Nickname",
                            text: $nickname,
                            field: fields[0],
                            nextField: fields[1],
                            currentFocusedField: $currentFocusedField
                        )
                        .focused($focusedField, equals: fields[0])
                        
                        AuthenticationTextField(
                            placeholder: "Email",
                            text: $email,
                            field: fields[1],
                            nextField: fields[2],
                            currentFocusedField: $currentFocusedField
                        )
                        .focused($focusedField, equals: fields[1])
                        
                        AuthenticationTextField(
                            placeholder: "Password",
                            text: $password,
                            field: fields[2],
                            nextField: fields[3],
                            currentFocusedField: $currentFocusedField
                        )
                        .focused($focusedField, equals: fields[2])
                        
                        AuthenticationTextField(
                            placeholder: "Confirm Password",
                            text: $confirmPassword,
                            field: fields[3],
                            currentFocusedField: $currentFocusedField
                        )
                        .focused($focusedField, equals: fields[3])
                    }
                    .onChange(
                        of: focusedField,
                        perform: onFocusedFieldValueChanged
                    )
                    
                    // Sign up button
                    AuthenticationButton("SIGN UP") {
                        self.dismiss()
                    }
                    
                    // Navigation to Sign Up page
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.primaryStyle(.body2))
                            .foregroundColor(.darkText)
                        
                        Button {
                            self.dismiss()
                        } label: {
                            Text("LOG IN")
                                .font(.primaryStyle(.body2))
                                .foregroundColor(.purpleText)
                        }
                    }
                    
                    Spacer()
                }
                .padding([.top, .horizontal], 32)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .cornerRadius(28, corners: [.topLeft, .topRight])
                .offset(
                    x: 0,
                    y: -(geometry.safeAreaInsets.top + 40)
                )
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    private func onFocusedFieldValueChanged(
        _ newValue: AuthenticationTextField.FocusableField?
    ) {
        switch newValue {
        case .none:
            self.currentFocusedField = nil
        default:
            self.currentFocusedField = focusedField
        }
    }
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
