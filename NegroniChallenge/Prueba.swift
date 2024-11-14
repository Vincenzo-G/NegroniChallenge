//
//  Prueba.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 13/11/24.
//

import SwiftUI

// Prueba (Prova) (Test) to pass information to the other views according to the level that the user did. 
struct Prueba: View {
    @EnvironmentObject private var progressTracker: ProgressTracker
    var places = ["Kitchen", "Classroom", "Bathroom", "Bedroom"]
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                ForEach(places, id:\.self) { place in
                    NavigationLink {
                        ViewLoca(objetos: progressTracker.getCurrentObjectNames(for: place) ?? [], currentPlace: place)
                    } label: {
                        Text(place)
                    }
                    
                }
            }
        }

    }
}

#Preview {
    Prueba()
        .environmentObject(ProgressTracker())
}

struct ViewLoca: View {
    var objetos: [String] = []
    var currentPlace: String = ""
    @EnvironmentObject private var progressTracker: ProgressTracker
    var body: some View {
        VStack {
            ForEach(objetos, id: \.self) { objeto in
                Text(objeto)
            }
            
            Button {
                progressTracker.advanceLevel(for: currentPlace)
            } label: {
                Text("Siguiente Nivel")
            }
        }
    }
}
