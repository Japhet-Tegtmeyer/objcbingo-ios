//
//  WidgetView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/16/24.
//

import SwiftUI

struct WidgetView: View {
    let imageName: String
    let title: String
    let color: Color
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.system(size: 30))
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
        }
        .frame(width: 160, height: 160)
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    WidgetView(imageName: "person", title: "Main", color: .blue)
}
