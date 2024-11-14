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
    var body: some View {
        NavigationStack {
        ZStack {
            Color.orange.opacity(0.3).edgesIgnoringSafeArea(.all)
                VStack(spacing: 30) {
                    Text("Welcome to the Kitchen!")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Please help me find the objects that I am missing! I forgot the names in my language!")
                        .font(.title3)
                    Image("Camarita")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                        .shadow(radius: 8)
                    NavigationLink {
                        ObjectsToDiscoverView(levelObjects: levelObjects)
                    } label: {
                        
                        Text("Discover your mission! ")
                            .padding()
                            .fontWeight(.semibold)
                            .background(Color.orange)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    
                            }
                            .foregroundStyle(.white)
                            .buttonStyle(.bordered)
                            .buttonBorderShape(.capsule)
                            
                    }
                }.padding(30)
                
            }
        }
        

    }
}

#Preview {
    InstructionsView()
}
