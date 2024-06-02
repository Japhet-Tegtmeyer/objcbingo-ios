//
//  EditProfileView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/25/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct EditProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var gameViewModel = GameViewModel()
    @State private var newName: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                // Sign-in rectangle
                Rectangle()
                    .frame(width: 350, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundStyle(.white)
                
                VStack {
                    VStack {
                        Text("Edit Profile")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Edit your info")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    
                    // Form fields
                    VStack(spacing: 24) {
                        InputView(text: $newName, title: "Name", placeholder: viewModel.currentUser!.fullName)
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                    }
                    .padding(.horizontal, 45)
                    .padding(.top)
                    
                    // Sign-in button
                    
                    Button {
                        Task {
                            if let user = viewModel.currentUser {
                                await setName(for: user)
                                await viewModel.fetchUser()
                            }
                        }
                        
                        dismiss()
                    } label: {
                        Text("Save")
                            .frame(width: 300, height: 40)
                            .background(.purple)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .foregroundStyle(.white)
                            .padding(.top)
                    }
                    .disabled(newName.isEmpty ? true : false)
                }
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
            }
        }
    }
    
    func setName(for user: User) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            // Update the s1 field to false
            try await userRef.updateData(["fullName": newName])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
}

#Preview {
    EditProfileView()
}
