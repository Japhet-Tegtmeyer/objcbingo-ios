//
//  IconListView.swift
//  Objec-Bingo
//
//  Created by Japhet Tegtmeyer on 6/16/24.
//

import SwiftUI

struct IconListView: View {
    @StateObject var iconSettings: IconSettings = IconSettings()
    var body: some View {
        NavigationStack {
            Form {
                Picker("App Icon", selection: $iconSettings.iconIndex) {
                    ForEach(iconSettings.icons.indices, id: \.self) { index in
                        IconRowView(icon: iconSettings.icons[index])
                            .tag(index)
                    }
                }
                .pickerStyle(.inline)
                .onChange(of: iconSettings.iconIndex) { newIndex in
                    guard UIApplication.shared.supportsAlternateIcons else {
                        print("App does not support alternate icons")
                        return
                    }
                    
                    let currentIndex = iconSettings.icons.firstIndex(where: { icon in
                        return icon.iconName == iconSettings.currentIconName
                    }) ?? 0
                    guard newIndex != currentIndex else { return }
                    let newIconSelection = iconSettings.icons[newIndex].iconName
                    UIApplication.shared.setAlternateIconName(newIconSelection) { error in
                        if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            .navigationTitle("App Icon")
        }
    }
}

#Preview {
    IconListView()
}
