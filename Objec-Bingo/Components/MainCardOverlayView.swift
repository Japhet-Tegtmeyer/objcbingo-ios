//
//  MainCardOverlayView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/25/24.
//

import SwiftUI

struct MainCardOverlayView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS1(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s1 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 189.5, y: 218)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS2(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s2 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 257, y: 218)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS3(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s3 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 325, y: 218)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS4(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s4 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 122, y: 218)
            
            ZStack {
                Rectangle()
                    .frame(width: 66, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS5(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s5 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 53.5, y: 218)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS6(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s6 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 189.5, y: 152)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS7(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s7 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 122, y: 152)
            
            ZStack {
                Rectangle()
                    .frame(width: 66, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS8(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s8 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 53.5, y: 152)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS9(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s9 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 257, y: 152)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS10(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s10 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 325, y: 152)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS11(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s11 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 325, y: 283.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS12(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s12 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 257, y: 283.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS13(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s13 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 189.5, y: 283.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS14(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s14 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 122, y: 283.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 66, height: 65.5)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS15(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s15 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 53.5, y: 283.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 66, height: 62)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS16(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s16 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 53.5, y: 347)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 62)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS17(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s17 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 122, y: 347)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 62)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS18(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s18 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 189.5, y: 347)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 62)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS19(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s19 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 257, y: 347)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 62)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS23(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s23 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 325, y: 347)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 60)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS20(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s20 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 189.5, y: 89.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 60)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS21(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s21 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 122, y: 89.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 66, height: 60)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS22(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s22 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 53.5, y: 89.5)
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 60)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS24(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s24 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 257, y: 89.5)
            
            
            ZStack {
                Rectangle()
                    .frame(width: 68, height: 60)
                    .foregroundStyle(.white.opacity(0.01))
                    .onTapGesture {
                        Task {
                            if let user = viewModel.currentUser {
                                await gameViewModel.toggleS25(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.s25 == true {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.accent)
                        .padding(2)
                        .background(.white)
                        .cornerRadius(99)
                }
            }
            .position(x: 325, y: 89.5)
        }
    }
}

#Preview {
    MainCardOverlayView()
}
