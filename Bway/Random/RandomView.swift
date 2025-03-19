//
//  RandomView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct RandomView: View {
    
    @State var randomGame: DataModel?
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.bgDark)
            
            
            VStack {
                HStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 30)
                    
                    Spacer()
                }
                .padding(.leading)
                Rectangle()
                    .frame(width: size().width, height: 1)
                    .foregroundStyle(.white.opacity(0.2))
                
                Spacer()
                
                Text("Don't know what to play? \nChoose a random game.")
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                Image("randomLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.vertical, 30)
                
                Button {
                    randomGame = DataManager.shared.getAllGames().randomElement()
                } label: {
                    Rectangle()
                        .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .bottom, endPoint: .top))
                        .frame(width: 190, height: 70)
                        .cornerRadius(16)
                        .overlay {
                            Text("Get a Game")
                                .foregroundStyle(.white)
                        }
                }
                
                Spacer()
            }
        }
        .fullScreenCover(item: $randomGame) { game in
            GameDetailView(entity: game)
        }
    }
}

#Preview {
    RandomView()
}
