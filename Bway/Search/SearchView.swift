//
//  SearchView.swift
//  Bway
//
//  Created by D K on 13.03.2025.


import SwiftUI


struct SearchView: View {
    
    @State private var text = ""
    @State private var gamesToSearch: [DataModel] = []
    @State private var filteredGames: [DataModel] = []
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
                
                Text("Search")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: size().width - 30, alignment: .leading)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("", text: $text, prompt: Text("Enter the name of the game").foregroundColor(.gray))
                        .onChange(of: text) { newValue in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                filterGames()
                            }
                        }
                        .foregroundStyle(.white)
                        .tint(.white)
                        .autocorrectionDisabled()
                }
                .padding()
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.bgFill)
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(lineWidth: 0.5)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal)
                
                // Список найденных игр
                if !filteredGames.isEmpty {
                    ScrollView {
                        ForEach(filteredGames) { game in
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
                    .padding(.bottom, 25)
                    .scrollIndicators(.hidden)
                } else {
                    Spacer()
                    
                    Image("searchLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.bottom, 20)
                    
                    Text("Nothing found")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.bottom, 40)
                    
                    Spacer()
                }
            }
        }
        .fullScreenCover(item: $gameToShow) { game in
            GameDetailView(entity: game)
        }
        .onAppear {
            gamesToSearch = DataManager.shared.getAllGames()
        }
    }
    
    private func filterGames() {
        if text.isEmpty {
            filteredGames = []
        } else {
            filteredGames = gamesToSearch.filter { $0.title.lowercased().contains(text.lowercased()) }
        }
    }
}
#Preview {
    SearchView()
}
