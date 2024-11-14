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
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Today's Mission")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Image("Camarita")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .padding()
      
            }.padding()
           
            
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
            

            }
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green.opacity(0.3)))
            .padding(20)
            
            Button {
                dismiss()
                dismiss()
            } label: {
                Text("START")
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 5)

                    
            }
        }
        
    }
}

#Preview {
    ObjectsToDiscoverView()
}
