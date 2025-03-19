//
//  WelcomeView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

extension View {
    func size() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
}

struct WelcomeView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var index = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
            
            VStack {
                switch index {
                case 0:
                    Image("s1")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 330)
                        .cornerRadius(12)
                case 1:
                    Image("s2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 330)
                        .cornerRadius(12)
                case 2:
                    Image("s3")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 330)
                        .cornerRadius(12)
                default:
                    Text("")
                }
                
                Spacer()
                
                switch index {
                case 0:
                    VStack {
                        Spacer()
                        
                        Text("Welcome!")
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                        
                        Spacer()
                        
                        Text("Immerse yourself in the world of exciting card and table games, as well as gambling entertainment!")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .thin))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .frame(height: 200)
                case 1:
                    VStack {
                        Spacer()
                        
                        Text("Choose a category and check out the game!")
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Text("Card, Table or Games of Risk games — everyone will find something to their liking.")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .thin))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .frame(height: 200)
                case 2:
                    VStack {
                        Spacer()
                        
                        Text("Add your favorite games!")
                            .foregroundStyle(.white)
                            .font(.system(size: 28, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        Text("Don't know what to choose? Just click on 'Choose a random game' and get an offer!")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .thin))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    .frame(height: 200)
                default: Text("")
                }
                
                Button {
                    withAnimation {
                        if index != 2 {
                            index += 1
                        } else {
                            dismiss()
                        }
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(width: size().width - 60, height: 70)
                            .cornerRadius(12)
                        
                        Text(index != 2 ? "Next" : "Start")
                            .foregroundStyle(.black)
                            .font(.system(size: 26, weight: .bold))
                    }
                }
            }
            .padding(.vertical)
            
        }
    }
}

#Preview {
    WelcomeView()
}
