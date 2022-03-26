//
//  LoginView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

struct LoginView: View {
    
    // Variables indicate user's registration info
    @State private var email = ""
    @State private var password = ""

//    // Variables indicate whether show involved views or not
//    @State private var showForgotPasswordView = false
//    @State private var showSignUpView = false
    
    // Variables indicate a specific field's focus state
    @State private var currentFocusedField: AuthenticationTextField.FocusableField? = nil
    @FocusState private var focusedField: AuthenticationTextField.FocusableField?
    private let fields: [AuthenticationTextField.FocusableField] = [
        .emailAddress(),
        .password(),
    ]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Image(Constants.Image.authHeaderWithWelcome)
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
                                field: fields[0],
                                nextField: fields[1],
                                currentFocusedField: $currentFocusedField
                            )
                            .focused($focusedField, equals: fields[0])
                            
                            AuthenticationTextField(
                                placeholder: "Password",
                                text: $password,
                                field: fields[1],
                                currentFocusedField: $currentFocusedField
                            )
                            .focused($focusedField, equals: fields[1])
                        }
                        .onChange(
                            of: focusedField,
                            perform: onFocusedFieldValueChanged
                        )
                        
                        // Forgot password button
                        NavigationLink {
                            EmailVerificationView(
                                stage: .getEmail,
                                onGetEmail: { _ in },
                                onVerifyCode: { _ in }
                            )
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
                            
                            // onDismiss
                            // Can fills registration info into login info
                            NavigationLink(destination: SignUpView()) {
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
                .navigationBarHidden(true)
            }
        }
        .navigationViewStyle(.stack)
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
