//
//  ObjectInfoModal.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 11/11/24.
//

import SwiftUI
import AVKit

struct ObjectInfoModal: View {
    var object: Object = Object(label: "Padella", name: "Padella", translation: "Pan")
    @EnvironmentObject var predictionStatus: PredictionStatus
    @EnvironmentObject private var progressTracker: ProgressTracker
    @Environment(\.dismiss) var dismiss
    @State var showTitle: Bool = false
    @State var isPressed = false
    
    var body: some View {
        
        ZStack {
            
            Color.customBrown.ignoresSafeArea()
            
            VStack {
                HStack {
                Image(object.label)
                    .resizable()
                    .scaledToFit()
                    .frame(width: showTitle ? 130 : 220)
                    .padding()
                    
                    if showTitle {
                        VStack(alignment: .leading) {
                            Text(object.label)
                                .foregroundStyle(.brown)
                                .font(.custom("SourGummy-Medium", size: 28))
                                .textCase(.uppercase)
                                .fontWeight(.bold)
                            Text(object.translation)
                                .font(.custom("SourGummy-Medium", size: 22))
                                .foregroundStyle(.brown.opacity(0.9))
                        }
                    }
               
                
 
                }
                
                VStack  {
                    
                    Button {
                        let utterance = AVSpeechUtterance(string: object.label)
                        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
                        utterance.rate = 0.5

                        let synthesizer = AVSpeechSynthesizer()
                        synthesizer.speak(utterance)
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding()
                            .font(.title)
                            .foregroundStyle(.brown)

                    }
                         
                    
                    
                    Button {
                        withAnimation {
                            progressTracker.addObject(object)
                            dismiss()
                        }

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
                                .offset(y: isPressed ? 3 : 0) // Move down when pressed
                            
                            Text("COLLECT!")
                                .font(.custom("SourGummy-Medium", size: 24))
                                .textCase(.uppercase)
                                .foregroundColor(Color(.customBrown))
                                .padding()
                                .offset(y: isPressed ? 5 : 0)
                        }.padding(.top, 50)
                        .padding(.horizontal, 60)

                    }
                    
                }
                     
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showTitle = true
                    }
                    
                }

            }
                    }
        
        
    }
}

#Preview {
    ObjectInfoModal()
}
