//
//  ContentView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var gameViewModel = GameViewModel()
    @State private var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                if viewModel.userSession != nil {
                    if viewModel.currentUser?.gameId != nil {
                        MainView()
                    } else {
                       JoinGameView()
                    }
                } else {
                    LoginView()
                }
            } else {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .ignoresSafeArea()
                    
                    Image("Icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 466)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
