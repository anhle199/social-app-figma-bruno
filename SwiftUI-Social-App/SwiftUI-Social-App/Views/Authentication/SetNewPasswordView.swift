//
//  SetNewPasswordView.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 26/03/2022.
//

import SwiftUI

struct SetNewPasswordView: View {
    
    // Variables indicate user's new password
    @State private var password = ""
    @State private var confirmPassword = ""
    
    // Variables indicate a specific field's focus state
    @State private var currentFocusedField: AuthenticationTextField.FocusableField? = nil
    @FocusState private var focusedField: AuthenticationTextField.FocusableField?
    private let fields: [AuthenticationTextField.FocusableField] = [
        .password(id: 0),
        .password(id: 1),
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                VStack(spacing: 0) {
                    Image(Constants.Image.authHeaderDefault)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                        .edgesIgnoringSafeArea(.top)
                    
                        VStack(spacing: 40) {
                            VStack(spacing: 20) {
                                Text("SET NEW PASSWORD")
                                    .font(.primaryStyle(.title2))
                                    .foregroundColor(.primaryColor)
                                
                                Text("Type your new password")
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
                            
                            VStack(spacing: 20) {
                                AuthenticationTextField(
                                    placeholder: "New Password",
                                    text: $password,
                                    field: fields[0],
                                    nextField: fields[1],
                                    currentFocusedField: $currentFocusedField
                                )
                                .focused($focusedField, equals: fields[0])
                                
                                AuthenticationTextField(
                                    placeholder: "Confirm New Password",
                                    text: $confirmPassword,
                                    field: fields[1],
                                    currentFocusedField: $currentFocusedField
                                )
                                .focused($focusedField, equals: fields[1])
                            }
                            .onChange(
                                of: focusedField,
                                perform: onFocusedFieldValueChanged
                            )

                            // Update button
                            AuthenticationButton("UPDATE", action: {})
                            
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

struct SetNewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        SetNewPasswordView()
    }
}
