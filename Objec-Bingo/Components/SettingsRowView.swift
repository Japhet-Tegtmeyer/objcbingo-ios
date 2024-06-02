//
//  SettingsRowView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.text)
        }
    }
}

#Preview {
    SettingsRowView(imageName: "gearshape", title: "Version", tintColor: Color(.systemGray))
}
