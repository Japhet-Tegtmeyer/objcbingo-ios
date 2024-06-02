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

struct MainView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // Authentication view model
    @StateObject private var gameViewModel = GameViewModel() // Game view model
    @State private var isSettingsShowing = false
    @State private var isEditing = false
    @State private var showSnapshotView = false
    @State private var snapshotImage: UIImage?
    @State private var lbIsShowing = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                VStack {
                    Text(gameViewModel.currentGame?.id ?? "NO_GAME")
                        .padding(.top, 50)
                    
                    Text("\(viewModel.currentUser?.fullName ?? "NO_NAME")")
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
                    
                    HStack {
                        Spacer()

                        Button(action: {
                            Task {
                                if let user = viewModel.currentUser {
                                    await gameViewModel.clearBoard(for: user)
                                } else {
                                    print("Current user is nil")
                                }
                                await viewModel.fetchUser()
                            }
                        }) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.red)
                                .padding()
                                .background(Color.red.opacity(0.2))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)

                        Button(action: {
                            Task {
                                if let user = viewModel.currentUser {
                                    await gameViewModel.clearBoard(for: user)
                                    await gameViewModel.setBoard(user: user)
                                } else {
                                    print("Current user is nil")
                                }
                                await viewModel.fetchUser()
                            }
                        }) {
                            Image(systemName: "arrow.clockwise")
                                .font(.title2)
                                .foregroundColor(.yellow)
                                .padding()
                                .background(Color.yellow.opacity(0.2))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)
                        
                        Button(action: {
                            let window = UIApplication.shared.keyWindow
                            let renderer = UIGraphicsImageRenderer(size: window?.bounds.size ?? CGSize.zero)
                            snapshotImage = renderer.image { _ in
                                window?.rootViewController?.view.drawHierarchy(in: window?.bounds ?? CGRect.zero, afterScreenUpdates: true)
                            }
                            shareImage()
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.title2)
                                .foregroundColor(.green)
                                .padding()
                                .background(.green.opacity(0.2))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)
                        
                        Button(action: {
                            lbIsShowing.toggle()
                        }) {
                            Image(systemName: "info.circle")
                                .font(.title2)
                                .foregroundColor(.blue)
                                .padding()
                                .background(.blue.opacity(0.2))
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)

                        Spacer()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color(.text).opacity(0.2))
                            .frame(width: 380)
                    )
                    .padding(.horizontal)
                }
                .padding(.top, -100)
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
            }
            .fullScreenCover(isPresented: $isSettingsShowing) {
                ProfileView()
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
    
    func shareImage() {
        guard let image = snapshotImage else {
            print("No image to share")
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}



#Preview {
    MainView()
}

