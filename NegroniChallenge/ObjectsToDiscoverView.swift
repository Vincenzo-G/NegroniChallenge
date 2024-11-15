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
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.clear,
                    Color(red: 1.0, green: 0.75, blue: 0),
                    
                    // Top color (slightly darker yellow)
                    // Bottom color (current yellow)
                ]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            VStack {
                VStack {
                    

                    Text("Your Mission")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                    
                    VStack {
                        LazyVGrid(columns: columns, spacing: 30) {
                            ForEach(levelObjects, id:\.self) { object in
                                Image(object)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: showMessage ? 80 : 120, height: showMessage ? 90 : 140)
                                    .padding(20)
                                    .shadow(radius: 8)
                                    .background(RoundedRectangle(cornerRadius: 30).fill(Color.orange.opacity(0.4)))
                            }
                        }
                        
                        
                    }
                    .padding(10)
                    
                    if showMessage {
                        HStack {
                            Image("CamaritaLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .offset(x: 0, y: 50)
                            
                            
                            Text("Find the objects above and unlock their names in my language! 🔎")
                                .padding()
                                .background()
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .listRowSeparator(.hidden)
                                .overlay(alignment: .bottomLeading) {
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.title)
                                        .rotationEffect(.degrees(45))
                                        .offset(x: -10, y: 10)
                                        .foregroundStyle(.white)
                                }
                            
                            
                        }.padding(.vertical)
                        
                        Button {
                            dismiss()
                            dismiss()
                        } label: {
                            Text("Start Mission")
                                .padding()
                                .foregroundStyle(.white)
                                .background(Color.brown)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 5)
                                .padding(.vertical, 40)
                            
                            
                        }
                    }
  
                    
                    
                    
                    
                }.padding()
                
                
                
                

            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showMessage = true
                }
                
            }
        }
        
        
    }
}

#Preview {
    ObjectsToDiscoverView()
}
