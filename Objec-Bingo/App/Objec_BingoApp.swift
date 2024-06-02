//
//  Objec_BingoApp.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI
import Firebase
import MijickPopupView

@main
struct Objec_BingoApp: App {
    @StateObject var viewModel = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var gameViewModel = GameViewModel()
    
//    init() {
//        FirebaseApp.configure()
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .fontDesign(.monospaced)
                .foregroundStyle(.text)
        }
    }
}
