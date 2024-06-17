//
//  ProfileView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var gameViewModel = GameViewModel()
    @State private var showingAlert = false
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationView {
                List {
                    Section {
                        HStack {
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .padding(.top, 4)
                                
                                Text(user.email)
                                    .font(.footnote)
                                    .foregroundStyle(.text.opacity(0.7))
                            }
                        }
                    }
                    
                    Section("General") {
                        HStack {
                            SettingsRowView(imageName: "gearshape", title: "Version", tintColor: Color(.systemGray))
                            Spacer()
                            Text("BETA 1.0.0")
                                .font(.subheadline)
                                .foregroundStyle(.text.opacity(0.7))
                        }
                        NavigationLink {
                            IconListView()
                        } label: {
                            SettingsRowView(imageName: "command.square", title: "Icon", tintColor: Color(.systemBlue))
                        }
                    }
                    
                    Section("Key") {
                        HStack {
                            SettingsRowView(imageName: "xmark", title: "", tintColor: .red)
                            
                            Spacer()
                            Text("=")
                            Spacer()
                            
                            Text("Clear Board")
                                .font(.subheadline)
                                .foregroundStyle(.text.opacity(0.7))
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "arrow.clockwise", title: "", tintColor: .yellow)
                            
                            Spacer()
                            
                            Text("=")
                            
                            Spacer()
                            
                            Text("New Board  ")
                                .font(.subheadline)
                                .foregroundStyle(.text.opacity(0.7))
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "square.and.arrow.up", title: "", tintColor: .green)
                            
                            Spacer()
                            
                            Text("=")
                            
                            Spacer()
                            
                            Text("Share Board")
                                .font(.subheadline)
                                .foregroundStyle(.text.opacity(0.7))
                        }
                        
                        HStack {
                            SettingsRowView(imageName: "info.circle", title: "", tintColor: .blue)
                            
                            Spacer()
                            
                            Text("=")
                            
                            Spacer()
                            
                            Text("Game Info  ")
                                .font(.subheadline)
                                .foregroundStyle(.text.opacity(0.7))
                        }
                    }
                    
                    Section("Game") {
                        Button {
                            showingAlert2.toggle()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Leave Game", tintColor: .red.opacity(0.5))
                        }
                    }
                    
                    Section("Account") {
                        Button {
                            showingAlert1.toggle()
                        } label: {
                            SettingsRowView(imageName: "arrow.left.circle.fill", title: "Sign Out", tintColor: .red.opacity(0.5))
                        }
                        
                        Button {
                            showingAlert.toggle()
                        } label: {
                            SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: .red)
                        }
                    }
                }
                .alert("Are you sure you want to delete your account?", isPresented: $showingAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Delete Account", role: .destructive) { viewModel.deleteAccount() }
                }
                .alert("Are you sure you want to sign out?", isPresented: $showingAlert1) {
                    Button("Cancel", role: .cancel) { }
                    Button("Sign Out", role: .destructive) { viewModel.signOut() }
                }
                .alert("Are you sure you want to leave the game?", isPresented: $showingAlert2) {
                    Button("Cancel", role: .cancel) { }
                    Button("Leave Game", role: .destructive) {
                        Task {
                            await gameViewModel.leaveGame(user: viewModel.currentUser!)
                            await gameViewModel.fetchCurrentGame()
                            await viewModel.fetchUser()
                        }
                    }
                }
                .toolbar {
                    Button {
                         dismiss()
                    } label: {
                        Text("Done")
                    }
                }
                .navigationTitle("Profile")
            }
        }
    }
}

#Preview {
    ProfileView()
}
