//
//  ChildCardOverlayView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/17/24.
//

import SwiftUI

struct ChildCardOverlayView: View {
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
                                await gameViewModel.toggleCS1(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs1 == true {
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
                                await gameViewModel.toggleCS2(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs2 == true {
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
                                await gameViewModel.toggleCS3(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs3 == true {
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
                                await gameViewModel.toggleCS4(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs4 == true {
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
                                await gameViewModel.toggleCS5(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs5 == true {
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
                                await gameViewModel.toggleCS6(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs6 == true {
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
                                await gameViewModel.toggleCS7(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs7 == true {
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
                                await gameViewModel.toggleCS8(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs8 == true {
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
                                await gameViewModel.toggleCS9(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs9 == true {
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
                                await gameViewModel.toggleCS10(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs10 == true {
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
                                await gameViewModel.toggleCS11(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs11 == true {
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
                                await gameViewModel.toggleCS12(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs12 == true {
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
                                await gameViewModel.toggleCS13(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs13 == true {
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
                                await gameViewModel.toggleCS14(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs14 == true {
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
                                await gameViewModel.toggleCS15(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs15 == true {
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
                                await gameViewModel.toggleCS16(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs16 == true {
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
                                await gameViewModel.toggleCS17(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs17 == true {
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
                                await gameViewModel.toggleCS18(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs18 == true {
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
                                await gameViewModel.toggleCS19(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs19 == true {
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
                                await gameViewModel.toggleCS23(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs23 == true {
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
                                await gameViewModel.toggleCS20(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs20 == true {
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
                                await gameViewModel.toggleCS21(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs21 == true {
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
                                await gameViewModel.toggleCS22(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs22 == true {
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
                                await gameViewModel.toggleCS24(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs24 == true {
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
                                await gameViewModel.toggleCS25(for: user)
                            }
                            await viewModel.fetchUser()
                        }
                    }
                
                if viewModel.currentUser?.cs25 == true {
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
    ChildCardOverlayView()
}
