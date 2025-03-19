//
//  GameDetailView.swift
//  Bway
//
//  Created by D K on 14.03.2025.
//

import SwiftUI

struct GameDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isFavorite = false
    
    var entity: DataModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.bgDark)
            
            
            VStack {
                Rectangle()
                    .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .top, endPoint: .bottom))
                    .clipShape(.rect(topLeadingRadius: 0, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 0))
                    .frame(width: size().width, height: 170)
                    .ignoresSafeArea()
                    .overlay {
                        ZStack {
                            Image(entity.image ?? "")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .colorInvert()
                                .blur(radius: 5)
                            
                            Text(entity.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 48, weight: .bold))
                        }
                        .padding(.bottom, 35)
                    }
                    .overlay {
                        VStack {
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                                
                                Spacer()
                                
                                Button {
                                    if !isFavorite {
                                        FavoriteGameManager.shared.addGameToFavorites(game: entity)
                                    } else {
                                        FavoriteGameManager.shared.removeGameFromFavorites(gameTitle: entity.title)
                                    }
                                    isFavorite.toggle()

                                } label: {
                                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                                        .foregroundStyle(.white)
                                        .bold()
                                }
                            }
                            .padding(.horizontal)
                            Spacer()
                        }
                    }
                
                ScrollView {
                    Text("Gameplay")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .thin))
                        .frame(width: size().width - 30, alignment: .leading)
                    
                    Text(entity.gameplay ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .regular))
                        .frame(width: size().width - 30, alignment: .leading)
                        .padding(.top, 10)
                    
                    Text("Basic Rules")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .thin))
                        .frame(width: size().width - 30, alignment: .leading)
                        .padding(.top, 10)
                    
                    Text(entity.basicRules ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .regular))
                        .frame(width: size().width - 30, alignment: .leading)
                        .padding(.top, 10)
                        .padding(.bottom, 150)
                }
                .scrollIndicators(.hidden)
            }
        }
        .onAppear {
            isFavorite = FavoriteGameManager.shared.isGameFavorite(gameTitle: entity.title)
        }
    }
}

#Preview {
    GameDetailView(entity:  DataModel(
        title: "Durak",
        gameplay: "A trick-taking game where players avoid being the last one with cards.",
        basicRules: "Played with a 36-card deck (6 and up). Each player starts with 6 cards. The goal is to discard all cards by playing higher cards of the same suit or trumps to beat attacks. One player attacks by playing a card, the defender must beat it or take it. If the defender succeeds, the attack moves to the next player. The trump suit is revealed from the bottom of the deck. The last player with cards is the 'fool' (Durak).",
        image: "cardsIcon"
    ))
}
