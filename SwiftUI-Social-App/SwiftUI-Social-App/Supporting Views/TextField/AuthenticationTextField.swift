//
//  AuthenticationTextField.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 24/03/2022.
//

import SwiftUI

struct AuthenticationTextField: View {

    let placeholder: String
    @Binding var text: String

    // Variables indicate type and current state of that field.
    let field: FocusableField
    let nextField: FocusableField?
    @Binding var currentFocusedField: FocusableField?
    @FocusState var isFocused: Bool
    @State private var state = FieldState.unfocused

    @State private var showPassword = false
    
    init(
        placeholder: String,
        text: Binding<String>,
        field: FocusableField,
        nextField: FocusableField? = nil,
        currentFocusedField: Binding<FocusableField?>
    ) {
        self.placeholder = placeholder
        self._text = text
        self.field = field
        self.nextField = nextField
        self._currentFocusedField = currentFocusedField
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField(placeholder, text: $text)
                .onChange(of: currentFocusedField) { newValue in
                    self.isFocused = field == newValue
                }
                .focused($isFocused)
                .textFieldStyle(.authentication(state: state))
            
                // Submit lable and action
                .submitLabel(nextField != nil ? .next : .done)
                .onSubmit { self.currentFocusedField = nextField }
            
                // Text content and keyboard type
                .textContentType(field.textContentType)
                .keyboardType(field.keyboardType)
            
                // Update field's state
                .onChange(of: isFocused, perform: onFocusStateChanged)
                .onChange(of: text, perform: onTextChanged)
            
            
            if field == .password {
                Button(action: { showPassword.toggle() }) {
                    Image(showPassword ? Constants.Icon.show : Constants.Icon.hide)
                        .padding(.trailing, 16)
                }
            }
        }
    }

    
    // MARK: - Value Changed Operations
    private func onFocusStateChanged(_ newValue: Bool) {
        if newValue {
            if state != .error {
                self.state = .focused
            }
        } else {
            self.state = text.isEmpty ? .error : .unfocused
        }
    }
    
    private func onTextChanged(_ newValue: String) {
        if newValue.isEmpty {
            self.state = .error
        } else {
            self.state = isFocused ? .focused : .unfocused
        }
    }
    
    
    // MARK: - Enumerations
    enum FocusableField: Hashable {
        case emailAddress, password

        fileprivate var textContentType: UITextContentType {
            switch self {
            case .emailAddress:
                return .emailAddress
            case .password:
                return .password
            }
        }

        fileprivate var keyboardType: UIKeyboardType {
            switch self {
            case .emailAddress:
                return .emailAddress
            case .password:
                return .default
            }
        }
    }

    enum FieldState {
        case unfocused, focused, error
    }

}

struct AuthenticationTextField_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationTextField(
            placeholder: "Email",
            text: .constant(""),
            field: .emailAddress,
            nextField: nil,
            currentFocusedField: .constant(.emailAddress)
        )
    }
}
