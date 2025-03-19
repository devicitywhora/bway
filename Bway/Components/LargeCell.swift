//
//  LargeCell.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct LargeCell: View {
    
    var entity: DataModel
    var completion: () -> ()
    var secondCompletion: () -> ()
    
    var body: some View {
        if entity.isComplet {
            RoundedRectangle(cornerRadius: 24)
                .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .top, endPoint: .bottom))
                .frame(width: size().width - 50, height: 250)
                .overlay {
                    VStack {
                        Image(entity.image ?? "cards")
                            .resizable()
                            .scaledToFill()
                            .frame(width: size().width - 90, height: 140)
                            .cornerRadius(20)
                        
                        Text(entity.title)
                            .foregroundStyle(.white)
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: size().width - 100, alignment: .leading)
                        
                        Text(entity.basicRules ?? "")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .thin))
                            .frame(width: size().width - 100, alignment: .leading)
                    }
                }
                .onTapGesture {
                    completion()
                }
        } else {
            Button {
                secondCompletion()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .fill(LinearGradient(colors: [.bgBlue1, .bgBlue2], startPoint: .top, endPoint: .bottom))
                        .frame(width: size().width - 50, height: 100)
                    HStack {
                        Image(entity.image ?? " ")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 50)
                            .colorInvert()
                        
                        Spacer()
                        
                        Text(entity.title)
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
}

#Preview {
    LargeCell(entity: DataModel(
        title: "Games of Risk",
        gameplay: "",
        basicRules: "Classic games of chance and risk-based entertainment",
        image: "cardsIcon",
        isComplet: false
    )){} secondCompletion: {}
}
