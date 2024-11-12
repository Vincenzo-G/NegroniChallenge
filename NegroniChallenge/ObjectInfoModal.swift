//
//  ObjectInfoModal.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 11/11/24.
//

import SwiftUI
import AVKit

struct ObjectInfoModal: View {
    var object: Object = Object(label: "Padella", name: "Amicizia", translation: "Refrigerator")
    
    var body: some View {
        
        Image(object.label)
            .resizable()
            .scaledToFit()
            .frame(width: 100)
            .padding()
        Text(object.label)
            .fontWeight(.semibold)
            .font(.title)
        
        Text(object.translation)
        
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

    }
}

#Preview {
    ObjectInfoModal()
}
