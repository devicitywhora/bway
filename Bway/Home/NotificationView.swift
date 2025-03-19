//
//  NotificationView.swift
//  Bway
//
//  Created by D K on 18.03.2025.
//

import SwiftUI

struct NotificationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.bgDark)
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    Text("Notifications")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .regular))
                        .padding(.trailing, 30)
                    
                    Spacer()
                    
                    
                }
                .padding(.leading)
                Rectangle()
                    .frame(width: size().width, height: 1)
                    .foregroundStyle(.white.opacity(0.2))
                
                Text("Here you can find out about new games that have been added")
                    .foregroundStyle(.gray)
                    .font(.system(size: 32, weight: .ultraLight))
                    .padding(50)
                    .multilineTextAlignment(.center)
                
                Image(systemName: "bell.badge")
                    .foregroundStyle(.gray.opacity(0.5))
                    .font(.system(size: 132, weight: .ultraLight))
                
                Spacer()
            }
        }
    }
}

#Preview {
    NotificationView()
}
