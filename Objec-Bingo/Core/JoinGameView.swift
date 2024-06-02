//
//  JoinGameView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/24/24.
//

import SwiftUI
import Firebase
import Combine
import Neumorphic

struct JoinGameView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var gameCode = Array(repeating: "", count: 5)
    @State private var user: User?
    @EnvironmentObject var authViewModel: AuthViewModel
    @FocusState private var focusedFieldIndex: Int?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    VStack(spacing: 10) {
                        Text("Game Code")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Please enter the game code given to you by your game leader to continue")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 30)
                            .frame(width: 350)
                    }
                    
                    HStack(spacing: 16) {
                        ForEach(0..<5) { index in
                            CodeFieldView(text: $gameCode[index], focusedField: _focusedFieldIndex, index: index)
                        }
                    }
                    
                    Button {
                        joinGame()
                    } label: {
                        Text("Join Game")
                            .font(.headline)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(.accent)
                            .cornerRadius(10)
                            .foregroundColor(.text)
                            .fontWeight(.medium)
                    }
                    .disabled(viewModel.currentGame != nil)
                    .padding(.top, 20)
                    
                }
                .padding()
            }
            .toolbar {
                Button {
                    Task {
                        await authViewModel.signOut()
                        await authViewModel.fetchUser()
                    }
                } label: {
                    Text("Sign Out")
                }
            }
        }
    }
    
    func joinGame() {
        Task {
            if let currentUser = Auth.auth().currentUser {
                guard let user = await fetchUser(userId: currentUser.uid) else {
                    print("Failed to fetch user")
                    return
                }
                let code = Int(gameCode.joined()) ?? 0
                await viewModel.joinGame(withCode: code, user: user)
                await viewModel.fetchCurrentGame()
                await authViewModel.fetchUser()
                await viewModel.setBoard(user: user)
            } else {
                print("User not authenticated")
            }
        }
    }
    
    func fetchUser(userId: String) async -> User? {
        let userDocRef = Firestore.firestore().collection("users").document(userId)
        do {
            let userDoc = try await userDocRef.getDocument()
            if let userData = try? userDoc.data(as: User.self) {
                return userData
            }
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
        }
        return nil
    }
}

struct CodeFieldView: View {
    @Binding var text: String
    @FocusState var focusedField: Int?
    let index: Int
    
    var body: some View {
        TextField("", text: $text)
            .focused($focusedField, equals: index)
            .multilineTextAlignment(.center)
            .frame(width: 50, height: 50)
            .background(Color.white)
            .foregroundStyle(.text)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .font(.title2)
            .keyboardType(.numberPad)
            .onChange(of: text) { newValue in
                if newValue.count > 1 {
                    text = String(newValue.last!)
                }
                if newValue.count == 1 {
                    focusedField = index + 1
                }
            }
    }
}

#if DEBUG
struct JoinGameView_Previews: PreviewProvider {
    static var previews: some View {
        JoinGameView()
    }
}
#endif
