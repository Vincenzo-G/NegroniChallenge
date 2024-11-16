//
//  ObjectsToDiscoverView.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 12/11/24.
//

import SwiftUI

struct ObjectsToDiscoverView: View {
    @Environment(\.dismiss) var dismiss
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    @State var showMessage = false
    @State private var revealProgress : CGFloat = 0
    @State private var isPressed = false


    
    var body: some View {
        ZStack {
            Color.customBrown
                .ignoresSafeArea()
            VStack {
                    HStack {
                        ZStack{
                            SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 30)
                                .fill(Color.white.opacity(0.7))
                                .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                            Text("Find the objects below and unlock their names in my language!")
                                .font(.custom("SourGummy-Medium", size: 22))
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
                                
                        }.frame(width: 250, height: 150).padding(.leading, 15)
                        
                        Image("Camarita")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.horizontal, 10)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    
                    VStack {
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(levelObjects, id:\.self) { object in
                                Image(object)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: showMessage ? 80 : 120, height: showMessage ? 90 : 140)
                                    .padding(20)
                                    .shadow(radius: 8)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(Color.white.opacity(0.5)))
                            }
                        }
                        
                        
                    }
                    .padding(10)
                     
                    Spacer()
                    
                        Button {
                            dismiss()
                            dismiss()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color(red: 0.40, green: 0.40, blue: 0.40))
                                    .frame(width: .infinity, height: 50)
                                    .padding(.horizontal, 2)
                                    .offset(y: isPressed ? 3 : 3)
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.brown)
                                    .frame(width: .infinity, height: 50)
                                    .padding(.horizontal, 2)
                                    .offset(y: isPressed ? 3 : 0)
                                
                                Text("START")
                                    .font(.custom("SourGummy-Medium", size: 24))
                                    .textCase(.uppercase)
                                    .foregroundColor(Color(.customBrown))
                                    .padding()
                                    .offset(y: isPressed ? 5 : 0)
                            }.padding(.horizontal, 10)
                                .padding(.bottom, 20)
                        }
                    }
                
        }
        
        
    }
}

#Preview {
    ObjectsToDiscoverView()
}
