//
//  ObjectScanOverlayView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//

import SwiftUI

struct ObjectScanOverlayView: View {
    
    var objectFound: Object?
    @EnvironmentObject var predictionStatus: PredictionStatus
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    let didTapOpen: (Object) -> Void
    @State private var revealProgress: CGFloat = 0
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    if let objectFound = objectFound {
                        HStack {
                            ZStack{
                                SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                                    .fill(Color.white.opacity(0.9))
                                    .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                                Text("Hey you found something!")
                                    .font(.custom("SourGummy-Medium", size: 24))
                                    .textCase(.uppercase)
                                    .foregroundStyle(.brown)
                                    .mask(
                                        Rectangle()
                                            .scaleEffect(x: revealProgress, y: 1, anchor: .leading)
                                    )
                                    .animation(.easeOut(duration: 0.5), value: revealProgress)
                                    .onAppear {
                                        revealProgress = 1
                                    }
                                    .padding()
                            }.frame(width: 190, height: 130)
                                .padding(.leading, 15)
                            
                            Image("Camarita")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(.horizontal, 10)
                        }
                    } else {
                        HStack {
                            ZStack{
                                SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                                    .fill(Color.white.opacity(0.9))
                                    .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                                Text("Keep searching...")
                                    .font(.custom("SourGummy-Medium", size: 24))
                                    .textCase(.uppercase)
                                    .foregroundStyle(.brown)
                                    .mask(
                                        Rectangle()
                                            .scaleEffect(x: revealProgress, y: 1, anchor: .leading)
                                    )
                                    .animation(.easeOut(duration: 0.5), value: revealProgress)
                                    .onAppear {
                                        revealProgress = 1
                                    }
                                    .padding()
                            }.frame(width: 190, height: 130).padding(.leading, 15)
                            
                            Image("Camarita")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(.horizontal, 10)
                        }
                    }
                    
                    if let object = objectFound {
                        
                        HStack {
                            Button("Discover it!", action: { didTapOpen(object) })
                                .padding(10)
                                .background(.brown)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .controlSize(.large)
                                .font(.custom("SourGummy-Medium", size: 24))
                                .textCase(.uppercase)
                                .foregroundStyle(.white)
                                .padding(.top, 30)
                        }
                        
                    }
                }.padding(26)
                    .frame(maxWidth: 550)
                //.background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 2)
                    .padding(.bottom, 90)
                Spacer()
                
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    ObjectScanOverlayView(objectFound: Object(label: "Frigorifero", name: "Frigorifero", translation: "Refrigerator"), didTapOpen: {_ in})
        .background {
            Image("Kitchen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
}
