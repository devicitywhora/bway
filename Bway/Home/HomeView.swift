//
//  HomeView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isFirstShown = false
    @State private var isSecondShown = false
    @State private var isThirdShown = false

    @State private var isXmarkShown = false
    @State private var isNotifShown = false
    @Binding var isTabBarShown: Bool
    var completion: () -> ()
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.bgDark)
            
            
            VStack {
                if !isXmarkShown {
                    HStack {
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 30)
                        
                        Spacer()
                        
                        Button {
                            isNotifShown.toggle()
                        } label: {
                            Image(systemName: "bell")
                                .foregroundStyle(.white)
                        }
                        .padding(.trailing)
                    }
                    .padding(.leading)
                    Rectangle()
                        .frame(width: size().width, height: 1)
                        .foregroundStyle(.white.opacity(0.2))
                }
                ScrollViewReader { proxy in
                    ScrollView {
                        CustomScroll(isCellsShown: $isFirstShown, isXmarkShown: $isXmarkShown, tasks: DataManager.shared.cardGames) {
                            showXmark()
                        
                            completion()
                        }
                        
                        CustomScroll(isCellsShown: $isSecondShown, isXmarkShown: $isXmarkShown, tasks: DataManager.shared.boardGames) {
                            showXmark()
                            completion()
                        }
                        
                        CustomScroll(isCellsShown: $isThirdShown, isXmarkShown: $isXmarkShown, tasks: DataManager.shared.gamesOfRisk) {
                            showXmark()
                            completion()
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                Spacer()
                Rectangle()
                    .frame(width: size().width, height: 1)
                    .foregroundStyle(.white.opacity(0.2))
            }
        }
        .overlay {
            if isXmarkShown {
                VStack {
                    HStack{
                        Spacer()
                        
                        Button {
                            withAnimation {
                                completion()
                                isFirstShown = false
                                isSecondShown = false
                                isThirdShown = false
                                isXmarkShown = false
                                isTabBarShown = true
                            }
                        } label: {
                            Circle()
                                .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .top, endPoint: .bottom))
                                .frame(width: 50, height: 50)
                                .overlay {
                                    Image(systemName: "xmark")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 20))
                                }
                        }
                        .padding(.trailing)
                    }
                    Spacer()
                }
            }
        }
        .fullScreenCover(isPresented: $isNotifShown) {
            NotificationView()
        }
    }
    
    func showXmark() {
        isXmarkShown = isFirstShown || isSecondShown || isThirdShown
        isTabBarShown = !isXmarkShown
    }
    
}

#Preview {
    HomeView(isTabBarShown: .constant(true)) {}
}
