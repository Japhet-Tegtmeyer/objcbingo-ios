//
//  LoginView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel 
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color(.background)
                
                VStack {
                    VStack {
                        Text("Sign in to ObjcBingo")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Welcome back! Please sign in to continue")
                            .font(.caption)
                            .foregroundStyle(.text.opacity(0.5))
                    }
                    
                    // Form fields
                    VStack(spacing: 24) {
                        InputView(text: $email, title: "Email Address", placeholder: "")
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        InputView(text: $password, title: "Password", placeholder: "", isSecureField: true)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                            .padding(.top, -12)
                    }
                    .padding(.horizontal, 45)
                    .padding(.top)
                    
                    // Sign-in button
                    
                    Button {
                        Task {
                            try await viewModel.signIn(withEmail: email, password: password)
                        }
                    } label: {
                        Text("Sign In")
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
                        Text("Don't have an account?")
                        
                        NavigationLink {
                            RegistrationView()
                        } label: {
                            Text("Sign Up")
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
                    .foregroundColor(.black)
                    .padding(2)
                    .background(.white)
                    .cornerRadius(5)
                    .padding(.top, 3)
                    .font(.caption)
                }
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 7
    }
}

#Preview {
    LoginView()
}
