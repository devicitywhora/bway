//
//  PagesView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct PagesView: View {
    
    @State private var isTabBarShown = true
    @State private var vis: Visibility = .visible
    @State private var isWelcome = false
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.softBlue2
       }
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView {
                    HomeView(isTabBarShown: $isTabBarShown) {
                    }
                        .tabItem {
                            Label("Home", systemImage: "house")
                        }
                        .toolbar(vis, for: .tabBar)
                    
                    RandomView()
                        .tabItem {
                            Label("Random", systemImage: "dice.fill")
                        }
                        .toolbar(vis, for: .tabBar)
                    
                    SearchView()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                        .toolbar(vis, for: .tabBar)
                    
                    FavoritesView()
                        .tabItem {
                            Label("Favorites", systemImage: "heart")
                        }
                        .toolbar(vis, for: .tabBar)
                    
                    SettingsView()
                        .tabItem {
                            Label("Settings", systemImage: "gearshape.fill")
                        }
                        .toolbar(vis, for: .tabBar)
                }
                .tint(.softBlue)
            }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "welcome") {
                UserDefaults.standard.setValue(true, forKey: "welcome")
                isWelcome = true
            }
        }
        .onChange(of: isTabBarShown) { value in
            if value {
                vis = .visible
            } else {
                vis = .hidden
            }
        }
        .fullScreenCover(isPresented: $isWelcome) {
            WelcomeView()
        }
    }
}

#Preview {
    PagesView()
}
