//
//  EmailVerificationView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 26/03/2022.
//

import SwiftUI

struct EmailVerificationView: View {
    
    let stage: VerificationStage
    let onGetEmail: (String) -> Void
    let onVerifyCode: (String) -> Void
    
    @State private var showVerificationCodeView = false
    
    // Variable indicate user's verification info
    @State private var text = ""
    
    // Variables indicate a specific field's focus state
    @State private var currentFocusedField: AuthenticationTextField.FocusableField? = nil
    @FocusState private var focusedField: AuthenticationTextField.FocusableField?
    private let field: AuthenticationTextField.FocusableField
    
    init(
        stage: VerificationStage,
        onGetEmail: @escaping (String) -> Void,
        onVerifyCode: @escaping (String) -> Void
    ) {
        self.stage = stage
        self.onGetEmail = onGetEmail
        self.onVerifyCode = onVerifyCode
        
        self.field = stage == .getEmail ? .emailAddress() : .oneTimeCode()
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0) {
                    Image(Constants.Image.authHeaderDefault)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                        .edgesIgnoringSafeArea(.top)
                    
                    ZStack {
                        if stage == .getEmail {
                            NavigationLink("", isActive: $showVerificationCodeView) {
                                EmailVerificationView(
                                    stage: .verifyCode,
                                    onGetEmail: { _ in },
                                    onVerifyCode: onVerifyCode
                                )
                            }
                        }
                        
                        VStack(spacing: 40) {
                            VStack(spacing: 20) {
                                Text(title)
                                    .font(.primaryStyle(.title2))
                                    .foregroundColor(.primaryColor)
                                
                                Text(description)
                                    .multilineTextAlignment(.center)
                                    .font(.primaryStyle(.body1))
                                    .foregroundColor(.primaryText)
                                    .lineSpacing(2)
                                    .padding(.vertical, 16)
                                    .padding(.horizontal, 24)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.primaryBackground)
                                    .cornerRadius(16)
                            }
                            
                            AuthenticationTextField(
                                placeholder: placholder,
                                text: $text,
                                field: field,
                                currentFocusedField: $currentFocusedField
                            )
                            .multilineTextAlignment(textAlignment)
                            .focused($focusedField, equals: field)
                            .onChange(of: focusedField) { newValue in
                                self.currentFocusedField = newValue
                            }
                            
                            if stage == .verifyCode {
                                Text("DON'T RECEIVE THE CODE")
                                    .font(.primaryStyle(.caption))
                                    .foregroundColor(.primaryText)
                                    .onTapGesture {
                                        // send new verification code
                                    }
                            }
                            
                            // Verify button
                            AuthenticationButton(buttonTitle) {
                                switch stage {
                                case .getEmail:
                                    self.onGetEmail(text)
                                    self.showVerificationCodeView.toggle()
                                case .verifyCode:
                                    self.onVerifyCode(text)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding([.top, .horizontal], 32)
                        .frame(maxHeight: .infinity)
                        .frame(width: geometry.size.width)
                        .background(.white)
                        .cornerRadius(28, corners: [.topLeft, .topRight])
                        .offset(
                            x: 0,
                            y: -(geometry.safeAreaInsets.top + 80)
                        )
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    HStack(spacing: 0) {
                        ForEach(0..<3) { _ in
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.authRectangleLinearGradientColor)
                                .frame(width: 65, height: 65)
                                .rotationEffect(.degrees(45))
                        }
                    }
                    .offset(x: 0, y: -20)
                }
                
                BackButton()
                    .padding(.leading, 20)
            }
            .navigationBarHidden(true)
        }
    }
    
    enum VerificationStage {
        case getEmail, verifyCode
    }
    
    var title: String {
        switch stage {
        case .getEmail:
            return "TYPE YOUR EMAIL"
        case .verifyCode:
            return "VERIFICATION"
        }
    }
    
    var description: String {
        switch stage {
        case .getEmail:
            return "We will send you verification code to reset your password."
        case .verifyCode:
            return "A message with verification code was sent to your email."
        }
    }
    
    var placholder: String {
        switch stage {
        case .getEmail:
            return "Email"
        case .verifyCode:
            return "Type Verification Code"
        }
    }
    
    var buttonTitle: String {
        switch stage {
        case .getEmail:
            return "SEND"
        case .verifyCode:
            return "VERIFY"
        }
    }
    
    var textAlignment: TextAlignment {
        switch stage {
        case .getEmail:
            return .leading
        case .verifyCode:
            return .center
        }
    }
    
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        EmailVerificationView(
            stage: .getEmail,
            onGetEmail: { _ in },
            onVerifyCode: { _ in }
        )
    }
}
