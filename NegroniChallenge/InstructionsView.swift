//
//  InstructionsView.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 12/11/24.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.dismiss) var dismiss
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    @State var showButton = false
    @State private var isPressed = false
    @State private var revealProgress : CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.customBrown)
                VStack(spacing: 18) {
                    
                    Spacer()
                    
                    VStack {
                        ZStack {
                            SpeechBubble(cornerRadius: 20, isBottom: true, pointLocation: 80)
                                .fill(Color.white.opacity(0.7))
                                .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                            
                            Text("Welcome my friend! Can you help me find the objects that I've lost?")
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
                        }
                        .frame(width: 300, height: 180)
                        
                        Image("Camarita")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 170)
                            .padding(.horizontal, 10)
                    }
                    .padding(.top, 80)
                    .padding(.bottom, 20)
                    
                    Spacer()
                    if showButton {
                        NavigationLink {
                            ObjectsToDiscoverView(levelObjects: levelObjects)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.40, green: 0.40, blue: 0.40))
                                    .frame(width: .infinity, height: 50)
                                    .padding(.horizontal, 2)
                                    .offset(y: isPressed ? 3 : 3) // Move up when pressed
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.brown)
                                    .frame(width: .infinity, height: 50)
                                    .padding(.horizontal, 2)
                                    .offset(y: isPressed ? 3 : 0) // Move down when pressed
                                
                                Text("YES!")
                                    .font(.custom("SourGummy-Medium", size: 24))
                                    .textCase(.uppercase)
                                    .foregroundColor(Color(.customBrown))
                                    .padding()
                                    .offset(y: isPressed ? 5 : 0)
                            }

                            
                        }.padding()
                    }
                
            }.padding(30)
            
            
        }.ignoresSafeArea()
            .textCase(.uppercase)
            .font(.custom("SourGummy-Medium", size: 24))
        
    }.onAppear {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showButton = true
            }
            
        }
    }
    
    
}
}

#Preview {
    InstructionsView()
}
