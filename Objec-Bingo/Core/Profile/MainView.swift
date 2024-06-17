//
//  MainView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import UIKit
import GoogleMobileAds

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // Authentication view model
    @StateObject private var gameViewModel = GameViewModel() // Game view model
    @State private var isSettingsShowing = false
    @State private var isEditing = false
    @State private var lbIsShowing = false
    @State private var isCreateChild = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                VStack {
                    TabView {
                        VStack {
                            Text(gameViewModel.currentGame?.id ?? "NO_GAME")
                                .padding(.top, 50)
                            
                            Text("\(viewModel.currentUser?.fullName ?? "")")
                                .font(.title)
                                .bold()
                                .onLongPressGesture {
                                    isEditing.toggle()
                                }
                            
                            ZStack {
                                Image(viewModel.currentUser?.cardId ?? "NO_BOARD")
                                    .resizable()
                                    .frame(width: 380, height: 380)
                                    .padding(.vertical)
                                    .overlay(
                                        MainCardOverlayView()
                                    )
                            }
                            
                            TabbView(lbIsShowing: $lbIsShowing)
                            
                        }
                        .padding(.top, -100)
                        .onAppear {
                            Task {
                                await viewModel.fetchUser()
                            }
                        }
                        
                        if viewModel.currentUser!.children > 0 {
                            VStack {
                                Text(gameViewModel.currentGame?.id ?? "NO_GAME")
                                    .padding(.top, 50)
                                
                                Text("\(viewModel.currentUser?.childName ?? "")")
                                    .font(.title)
                                    .bold()
                                    .onLongPressGesture {
                                        isEditing.toggle()
                                    }
                                
                                ZStack {
                                    Image(viewModel.currentUser?.childCardId ?? "NO_BOARD")
                                        .resizable()
                                        .frame(width: 380, height: 380)
                                        .padding(.vertical)
                                        .overlay(
                                            ChildCardOverlayView()
                                        )
                                }
                                
                                ChildTabView(lbIsShowing: $lbIsShowing)
                            }
                            .padding(.top, -100)
                            .onAppear {
                                Task {
                                    await viewModel.fetchUser()
                                }
                            }
                        }
                        
                        if viewModel.currentUser!.children > 1 {
                            VStack {
                                Text(gameViewModel.currentGame?.id ?? "NO_GAME")
                                    .padding(.top, 50)
                                
                                Text("\(viewModel.currentUser?.secondChildName ?? "")")
                                    .font(.title)
                                    .bold()
                                    .onLongPressGesture {
                                        isEditing.toggle()
                                    }
                                
                                ZStack {
                                    Image(viewModel.currentUser?.secondChildCardId ?? "NO_BOARD")
                                        .resizable()
                                        .frame(width: 380, height: 380)
                                        .padding(.vertical)
                                        .overlay(
                                            SecondChildCardOverlayView()
                                        )
                                }
                                
                                SecondChildTabView(lbIsShowing: $lbIsShowing)
                            }
                            .padding(.top, -100)
                            .onAppear {
                                Task {
                                    await viewModel.fetchUser()
                                }
                            }
                        }
                    }
                    .tabViewStyle(.page)
                    
//                    BannerView()
//                        .frame(width: GADAdSizeBanner.size.width,
//                               height: GADAdSizeBanner.size.height)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isSettingsShowing.toggle()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .padding(8)
                            .foregroundStyle(.blue)
                            .background(.white)
                            .clipShape(Circle())
                    }
                    .padding(8)
                }
                
                if viewModel.currentUser!.children < 2 {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isCreateChild.toggle()
                        } label: {
                            Image(systemName: "person.fill.badge.plus")
                                .padding(9.5)
                                .foregroundStyle(.green)
                                .background(.white)
                                .clipShape(Circle())
                        }
                        .padding(.top, 8)
                        .padding(.trailing, 8)
                        .padding(.leading, -8)
                    }
                }
            }
            .fullScreenCover(isPresented: $isSettingsShowing) {
                ProfileView()
            }
            .fullScreenCover(isPresented: $isCreateChild) {
                ChildCreationView()
            }
            .fullScreenCover(isPresented: $isEditing) {
                EditProfileView()
            }
            .fullScreenCover(isPresented: $lbIsShowing) {
                GameInfoView()
            }
            .onAppear {
                Task {
                    await viewModel.fetchUser()
                }
            }
        }
    }
}



#Preview {
    MainView()
}

