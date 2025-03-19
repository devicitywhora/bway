//
//  SwiftUIView.swift
//  Bway
//
//  Created by D K on 13.03.2025.
//

import SwiftUI

struct DataModel: Identifiable {
    var id = UUID()
    var title: String
    var gameplay: String?
    var basicRules: String?
    var image: String?
    var isComplet: Bool = false
}

struct CustomScroll: View {
    
    @Binding var isCellsShown: Bool
    @Binding var isXmarkShown: Bool

    
    var tasks: [DataModel]
    @State private var gameToShow: DataModel?
    
    var completion: () -> ()
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(tasks.indices, id: \.self) { index in
                            let task = tasks[index]
                            let scaleValue = 1.0 - (CGFloat(index) * 0.02)
                            let opacityValue = 1.0 - (CGFloat(index) * 0.02)
                            
                            ZStack {
                                LargeCell(entity: task) {
                                    
                                    withAnimation {                                        
                                        isCellsShown.toggle()
                                        
                                        completion()
                                    }
                                    withAnimation {
                                        proxy.scrollTo(0, anchor: .top)
                                    }    
                                } secondCompletion: {
                                    gameToShow = task
                                }
                            }
                            .bold()
                            .foregroundStyle(.white).padding(.horizontal)
                            .frame(height: task.isComplet ? 250 : 100).frame(maxWidth: .infinity)
                            .opacity( index == 0 ? 1 : (isCellsShown ? 1 : 0))
                            .zIndex(Double(-1 * index))
                            .scaleEffect(isCellsShown ? 1 : scaleValue)
                            .opacity(isCellsShown ? 1 : opacityValue)
                            .offset(y: CGFloat(isCellsShown ? 0 * index : -56 * index))
                        }
                    }
                }
                .scrollDisabled(!isCellsShown)
                
                .frame(height: isCellsShown ? nil : 250, alignment: .top)
            }
        }
        .fullScreenCover(item: $gameToShow) { game in
            GameDetailView(entity: game)
        }

    }
}

#Preview {
    CustomScroll(isCellsShown: .constant(false), isXmarkShown: .constant(false), tasks: []){}
        .preferredColorScheme(.dark)
}
