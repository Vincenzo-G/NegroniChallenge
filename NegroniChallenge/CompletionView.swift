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
    @EnvironmentObject private var progressTracker: ProgressTracker
    var currentSetting: String = "Kitchen"
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Color.customBrown.ignoresSafeArea()
            VStack {
                HStack {
                    ZStack {
                        SpeechBubble(cornerRadius: 20, isBottom: false, pointLocation: 80)
                            .fill(Color.white.opacity(0.7))
                            .stroke(Color.brown.opacity(0.5), lineWidth: 3)
                        
                        Text("Congratulations my friend! You found all the objects! ")
                            .font(.custom("SourGummy-Medium", size: 24))
                            .textCase(.uppercase)
                            .foregroundStyle(.brown)
                        


                            .padding()
                    }
                    .frame(width: 260, height: 160)
                    
                    Image("Camarita")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.horizontal, 10)
                    
                }.padding(.vertical)


                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(levelObjects, id:\.self) { object in
                        VStack {
                            Image(object)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height:120)
                                .padding(20)
                                .shadow(radius: 8)
                                .background(RoundedRectangle(cornerRadius: 30).fill(Color.white.opacity(0.5)))
                            
                            Text(object)
                                .font(.custom("SourGummy-Medium", size: 18))
                                
                        }
  
                        
                    }
                }
                
                ZStack {
                    
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color(red: 0.40, green: 0.40, blue: 0.40))
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal, 2)
             
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.brown)
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal, 2)
             
                        
                    Button {
                        dismiss()
                        isPresented = true
                       progressTracker.advanceLevel(for: currentSetting)
                        print("funciona? :(")
                    } label: {
                        Text("Complete level")
                            .font(.custom("SourGummy-Medium", size: 24))
                            .textCase(.uppercase)
                            .foregroundColor(Color(.customBrown))
                            .padding()
                    }

            
                    
                }.padding(.top, 15)
                .padding(.horizontal, 60)

        
            }
        }.fullScreenCover(isPresented: $isPresented) {
            SettingView()
        }
         
    }
}

#Preview {
    CompletionView()
}
