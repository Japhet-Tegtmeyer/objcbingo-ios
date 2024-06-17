//
//  TabButton.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/16/24.
//

import SwiftUI

struct TabButton: View {
    var action: () -> Void
    var symbol: String
    var color: Color
    
    var body: some View {
        Button(action: action) {
            Image(systemName: symbol)
                .font(.title2)
                .foregroundColor(color)
                .padding()
                .background(color.opacity(0.2))
                .clipShape(Circle())
        }
        .padding(.trailing, 16)
    }
}

#Preview {
    TabButton(
        action: { print("Test") },
        symbol: "arrow.clockwise",
        color: .yellow
    )
}
