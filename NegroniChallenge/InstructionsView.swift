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
    @State var showChat = false
    @State var showButton = false

    var body: some View {
        NavigationStack {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.clear,
                    Color(red: 1.0, green: 0.75, blue: 0) // Top color (slightly darker yellow)
                     // Bottom color (current yellow)
                ]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
                VStack(spacing: 18) {
                    
                    Text("The Kitchen")
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                    
                    
                    Image("Camarita")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .shadow(radius: 8)
                        .padding(.top)
                    
                    if showChat {
                        VStack {
                            Image(systemName: "triangle.fill")
                                .foregroundStyle(.white).opacity(0.9)
                                .offset(y: 4)
                            
                            Text("Welcome my friend! Can you help me find the objects that I've lost? 🥹")
                                .multilineTextAlignment(.center)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 20).fill(.white).opacity(0.9))
                            if showButton {
                                NavigationLink {
                                    ObjectsToDiscoverView(levelObjects: levelObjects)
                                } label: {
                                    
                                    Text("Open mission 🚀")
                                        .padding()
                                        .fontWeight(.semibold)
                                        .background(Color.orange)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 1)
                                                
                                        }
                                        .foregroundStyle(.white)
                                        .buttonStyle(.bordered)
                                        .buttonBorderShape(.capsule)
                                        .padding()
                                        
                                }.padding()
                            }
  
                        }
                    }
                    

                    
                   
                    
                        
                    
                    
                    
                    
                     
                }.padding(30)
                    
                
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    showChat = true
                }
                
            }
            
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
