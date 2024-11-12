//
//  InstructionsView.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 12/11/24.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Text("Welcome to the Kitchen!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Your mission is to find the missing objects and learn their meanings in Italian!")
                    .font(.title3)
                Image("Camarita")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                NavigationLink {
                    ObjectsToDiscoverView()
                } label: {
                    Text("Discover the objects")
                        
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        
                }
            }.padding()
            
        }

    }
}

#Preview {
    InstructionsView()
}
