//
//  RegistrationBand.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color(.background)
                
                VStack {
                    VStack {
                        Text("Sign up to ObjcBingo")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Please sign up to continue")
                            .font(.caption)
                            .foregroundStyle(.text.opacity(0.5))
                    }
                    
                    // Form fields
                    VStack(spacing: 24) {
                        InputView(text: $email, title: "Email Address", placeholder: "")
                            .autocapitalization(.none)
                        
                        InputView(text: $fullName, title: "Full Name", placeholder: "")
                        
                        InputView(text: $password, title: "Password", placeholder: "", isSecureField: true)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .padding(.top, -12)
                        
                        InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "", isSecureField: true)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                            .padding(.top, -12)
                    }
                    .padding(.horizontal, 45)
                    .padding(.top)
                    
                    // Sign-in button
                    
                    Button {
                        Task {
                            try await viewModel.createUser(withEmail: email, password: password, fullname: fullName)
                        }
                    } label: {
                        Text("Sign Up")
                            .frame(width: 300, height: 40)
                            .background(.accent)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding(.top)
                            .foregroundColor(.text)
                            .fontWeight(.medium)
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    
                    // Sign-up button
                    
                    HStack {
                        Text("Have an account?")
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Sign In")
                                .foregroundStyle(.accent)
                                .bold()
                        }
                    }
                    .font(.system(size: 15))
                    .padding(.top)
                    .padding(.bottom, -1)
                    
                    HStack {
                        Text("Secured by")
                        Image("firebase")
                            .resizable()
                            .frame(width: 65, height: 20)
                    }
                    .font(.caption)
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 7
        && !fullName.isEmpty
        && fullName.contains(" ")
        && email.contains(".com")
        && confirmPassword == password
    }
}

#Preview {
    RegistrationView()
}
