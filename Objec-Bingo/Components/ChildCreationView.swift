//
//  ChildCreationView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/17/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import UIKit

struct ChildCreationView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // Authentication view model
    @StateObject private var gameViewModel = GameViewModel() // Game view model
    @State private var childName: String = ""
    @State private var secondChildName: String = ""
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.currentUser!.children < 1 {
                    VStack {
                        InputView(text: $childName, title: "Child Name", placeholder: "")
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        Button {
                            Task {
                                do {
                                    try await viewModel.addChild()
                                    if let user = viewModel.currentUser {
                                        await setChildName(for: user)
                                        await viewModel.fetchUser()
                                        await gameViewModel.setChildBoard(user: user)
                                    }
                                    dismiss()
                                } catch {
                                    print("Error adding child: \(error)")
                                }
                            }
                        } label: {
                            Text("Create Child")
                                .frame(width: 300, height: 40)
                                .background(.accent)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding(.top)
                                .foregroundColor(.text)
                                .fontWeight(.medium)
                        }
                    }
                } else {
                    VStack {
                        InputView(text: $secondChildName, title: "Child Name", placeholder: "")
                            .autocapitalization(.none)
                            .autocorrectionDisabled(true)
                        
                        Button {
                            Task {
                                do {
                                    try await viewModel.addChild()
                                    await viewModel.fetchUser()
                                    if let user = viewModel.currentUser {
                                        await setSecondChildName(for: user)
                                        await gameViewModel.setSecondChildBoard(user: user)
                                    }
                                    dismiss()
                                } catch {
                                    print("Error adding child: \(error)")
                                }
                            }
                        } label: {
                            Text("Create Child")
                                .frame(width: 300, height: 40)
                                .background(.accent)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding(.top)
                                .foregroundColor(.text)
                                .fontWeight(.medium)
                        }
                    }
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
    func setChildName(for user: User) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            // Update the s1 field to false
            try await userRef.updateData(["childName": childName])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
    
    func setSecondChildName(for user: User) async {
        do {
            // Reference to the user document
            let userRef = Firestore.firestore().collection("users").document(user.id)
            // Update the s1 field to false
            try await userRef.updateData(["secondChildName": secondChildName])
        } catch {
            print("DEBUG: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ChildCreationView()
}
