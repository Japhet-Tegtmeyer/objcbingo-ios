//
//  ChildTabView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/17/24.
//

import SwiftUI

struct ChildTabView: View {
    @EnvironmentObject var viewModel: AuthViewModel  // Authentication view model
    @StateObject private var gameViewModel = GameViewModel() // Game view model
    @State private var isSettingsShowing = false
    @State private var isEditing = false
    @State private var showSnapshotView = false
    @State private var snapshotImage: UIImage?
    @Binding var lbIsShowing: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            TabButton(action: {
                Task {
                    if let user = viewModel.currentUser {
                        await gameViewModel.clearChildBoard(for: user)
                    } else {
                        print("Current user is nil")
                    }
                    await viewModel.fetchUser()
                }
            }, symbol: "xmark", color: .red)
            
            TabButton(action: {
                Task {
                    if let user = viewModel.currentUser {
                        await gameViewModel.clearChildBoard(for: user)
                        await gameViewModel.setChildBoard(user: user)
                    } else {
                        print("Current user is nil")
                    }
                    await viewModel.fetchUser()
                }
            }, symbol: "arrow.clockwise", color: .yellow)
            
            TabButton(action: {
                let window = UIApplication.shared.keyWindow
                let renderer = UIGraphicsImageRenderer(size: window?.bounds.size ?? CGSize.zero)
                snapshotImage = renderer.image { _ in
                    window?.rootViewController?.view.drawHierarchy(in: window?.bounds ?? CGRect.zero, afterScreenUpdates: true)
                }
                shareImage()
            }, symbol: "square.and.arrow.up", color: .green)
            
            TabButton(action: {
                lbIsShowing.toggle()
            }, symbol: "info.circle", color: .blue)
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.text).opacity(0.1))
                .frame(width: 380)
        )
        .padding(.horizontal)
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
    ChildTabView(lbIsShowing: .constant(false))
}
