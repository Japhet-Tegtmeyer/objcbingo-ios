//
//  IconRowView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/16/24.
//

import SwiftUI

struct IconRowView: View {
    public let icon: Icon
    var body: some View {
        HStack(alignment: .center) {
            Image(uiImage: icon.image ?? UIImage())
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .padding(.trailing)
            
            Text(icon.displayName)
                .bold()
        }
        .padding(8)
    }
}

#Preview {
    IconRowView(icon: Icon(displayName: "", iconName: "", image: UIImage()))
}
