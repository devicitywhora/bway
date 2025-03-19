//
//  FavoritesView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct FavoritesView: View {
    
    @State private var favoriteGames: [DataModel] = []
    @State var gameToShow: DataModel?
    
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
                
                Text("Favorites")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: size().width - 30, alignment: .leading)
                
                if favoriteGames.isEmpty {
                    Spacer()
                    
                    Image("favoritesLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 20)
                    
                    Text("No favorite games")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 5)
                    
                    Text("Add games to your favorites to see them here")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .thin))
                        .padding(.bottom, 40)
                        .multilineTextAlignment(.center)
                    
                    
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(favoriteGames, id: \.id) { game in
                            Button {
                                gameToShow = game
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .top, endPoint: .bottom))
                                        .frame(width: size().width - 50, height: 100)
                                    HStack {
                                        Image(game.image ?? " ")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 50)
                                            .colorInvert()
                                        
                                        Spacer()
                                        
                                        Text(game.title)
                                            .font(.system(size: 20))
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.horizontal, 30)
                                    
                                }
                                .frame(width: size().width - 50)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.bottom, 25)
                }
                
                
            }
        }
        .onAppear {
            favoriteGames = FavoriteGameManager.shared.getAllFavoriteGames()
        }
        .fullScreenCover(item: $gameToShow) { game in
            GameDetailView(entity: game)
                .onDisappear {
                    favoriteGames = []
                    favoriteGames = FavoriteGameManager.shared.getAllFavoriteGames()
                }
        }
    }
}

#Preview {
    FavoritesView()
}
