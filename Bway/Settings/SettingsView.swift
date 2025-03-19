//
//  SettingsView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isDeletionAlertShown = false
    @State private var isFirstShown = false
    @State private var isSecindShown = false

    
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
                
                Text("Settings")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: size().width - 30, alignment: .leading)
                
                Button {
                    isFirstShown.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .bottom, endPoint: .top))
                        .frame(width: size().width - 40, height: 70)
                        .overlay {
                            HStack {
                                Image("contact")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                Text("Contact Us")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                    .padding(.bottom, 1)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        }
                }
                
                Button {
                    isSecindShown.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .bottom, endPoint: .top))
                        .frame(width: size().width - 40, height: 70)
                        .overlay {
                            HStack {
                                Image("privacy")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                Text("Privacy Policy")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                    .padding(.bottom, 1)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        }
                }
                .padding(.vertical)
                
                Button {
                    isDeletionAlertShown.toggle()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(colors: [.darkRed, .softRed], startPoint: .bottom, endPoint: .top))
                        .opacity(0.3)
                        .frame(width: size().width - 40, height: 70)
                        .overlay {
                            HStack {
                                Image("delete")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                
                                Text("Delete All Data")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 20))
                                    .padding(.bottom, 1)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                        }
                }
                
                
                Spacer()
            }
        }
        .sheet(isPresented: $isFirstShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/betwayrules/contact-us")
                .presentationDetents([.height(size().height / 1.15)])
        }
        .sheet(isPresented: $isSecindShown) {
            PrivacyPolicyWrapper(privacyURL: "https://sites.google.com/view/betwayrules/privacy-policy")
                .presentationDetents([.height(size().height / 1.15)])
        }
        .alert("Are you sure?", isPresented: $isDeletionAlertShown) {
            Button {
                FavoriteGameManager.shared.removeAllFavoriteGames()
            } label: {
                Text("Yes")
            }
            
            Button {

            } label: {
                Text("No")
            }
        } message: {
            Text("All games in your favorites will be removed.")
        }

    }
}

#Preview {
    SettingsView()
}
