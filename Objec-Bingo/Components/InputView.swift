//
//  InputView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 5/23/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .fontWeight(.medium)
                .font(.subheadline)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding(9)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .padding(9)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "")
}
