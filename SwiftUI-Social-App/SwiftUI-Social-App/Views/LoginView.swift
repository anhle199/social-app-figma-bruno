//
//  LoginView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false
    @State private var showForgotPasswordView = false
    @State private var showSignUpView = false
    @State private var currentFocusedField: AuthenticationTextField.FocusableField? = nil
    @FocusState private var focusedField: AuthenticationTextField.FocusableField?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(Constants.Image.loginHeader)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.top)
                
                VStack(spacing: 40) {
                    // Login form
                    VStack(spacing: 20) {
                        AuthenticationTextField(
                            placeholder: "Email",
                            text: $email,
                            field: .emailAddress,
                            nextField: .password,
                            currentFocusedField: $currentFocusedField
                        )
                        .focused($focusedField, equals: .emailAddress)
                        
                        AuthenticationTextField(
                            placeholder: "Password",
                            text: $password,
                            field: .password,
                            currentFocusedField: $currentFocusedField
                        )
                        .focused($focusedField, equals: .password)
                    }
                    .onChange(
                        of: focusedField,
                        perform: onFocusedFieldValueChanged
                    )
                    
                    // Forgot password button
                    Button {
                        showForgotPasswordView.toggle()
                    } label: {
                        Text("FORGOT PASSWORD")
                            .font(.primaryStyle(.caption))
                            .foregroundColor(.purpleText)
                    }
                    
                    // Login button
                    AuthenticationButton("LOG IN", action: {})
                    
                    // Other login methods
                    VStack(spacing: 20) {
                        Text("OR LOG IN BY")
                            .font(.primaryStyle(.caption))
                            .foregroundColor(.darkText)
                        
                        HStack(spacing: 16) {
                            Button(action: {}) {
                                Image(Constants.Icon.google)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(8)
                                    .background(
                                        Color.thirdPartyAuthenticationBackground
                                    )
                                    .clipShape(Circle())
                            }
                            
                            Button(action: {}) {
                                Image(Constants.Icon.facebookFill)
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding(8)
                                    .background(
                                        Color.thirdPartyAuthenticationBackground
                                    )
                                    .clipShape(Circle())
                            }
                        }
                    }
                    
                    // Navigation to Sign Up page
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            .font(.primaryStyle(.body2))
                            .foregroundColor(.darkText)
                        
                        Button {
                            showSignUpView.toggle()
                        } label: {
                            Text("SIGN UP")
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

extension Color {
    fileprivate static let purpleText = Color(red: 82 / 255.0, green: 82 / 255.0, blue: 189 / 255.0)
    fileprivate static let darkText = Color(red: 96 / 255.0, green: 96 / 255.0, blue: 96 / 255.0)
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
