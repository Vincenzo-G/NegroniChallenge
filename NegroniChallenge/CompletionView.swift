//
//  CompletionView.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 12/11/24.
//

import SwiftUI

struct CompletionView: View {
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(levelObjects, id:\.self) { object in
                    Image(object)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(20)
                        .shadow(radius: 8)
                }
            }
            
            Button {
                dismiss()
                dismiss()
                dismiss()
            } label: {
                Text("Complete level!")
            }
            
        }
    }
}

#Preview {
    CompletionView()
}
