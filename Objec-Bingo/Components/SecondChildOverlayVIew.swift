//
//  SecondChildOverlayVIew.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/17/24.
//

import SwiftUI

struct SecondChildCardOverlayView: View {
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
                                await gameViewModel.toggleC2S1(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s1 == true {
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
                                await gameViewModel.toggleC2S2(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s2 == true {
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
                                await gameViewModel.toggleC2S3(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s3 == true {
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
                                await gameViewModel.toggleC2S4(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s4 == true {
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
                                await gameViewModel.toggleC2S5(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s5 == true {
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
                                await gameViewModel.toggleC2S6(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s6 == true {
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
                                await gameViewModel.toggleC2S7(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s7 == true {
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
                                await gameViewModel.toggleC2S8(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s8 == true {
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
                                await gameViewModel.toggleC2S9(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s9 == true {
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
                                await gameViewModel.toggleC2S10(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s10 == true {
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
                                await gameViewModel.toggleC2S11(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s11 == true {
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
                                await gameViewModel.toggleC2S12(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s12 == true {
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
                                await gameViewModel.toggleC2S13(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s13 == true {
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
                                await gameViewModel.toggleC2S14(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s14 == true {
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
                                await gameViewModel.toggleC2S15(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s15 == true {
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
                                await gameViewModel.toggleC2S16(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s16 == true {
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
                                await gameViewModel.toggleC2S17(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s17 == true {
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
                                await gameViewModel.toggleC2S18(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s18 == true {
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
                                await gameViewModel.toggleC2S19(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s19 == true {
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
                                await gameViewModel.toggleC2S23(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s23 == true {
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
                                await gameViewModel.toggleC2S20(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s20 == true {
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
                                await gameViewModel.toggleC2S21(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s21 == true {
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
                                await gameViewModel.toggleC2S22(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s22 == true {
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
                                await gameViewModel.toggleC2S24(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s24 == true {
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
                                await gameViewModel.toggleC2S25(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.c2s25 == true {
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
    SecondChildCardOverlayView()
}
