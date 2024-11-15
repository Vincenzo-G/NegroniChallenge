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
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 1.0, green: 0.8, blue: 0),
                    Color.clear
                ]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
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
                                .fontWeight(.semibold)
                                .font(.largeTitle)
                            
                            Text(object.translation)
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
                            .padding()
                            .font(.title)
                    }
                         
                    
                    
                    Button {
                        withAnimation {
                            progressTracker.addObject(object)
                            dismiss()
                        }

                    } label: {
                        Text("Collect!")
                        
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
