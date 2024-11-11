//
//  ClassificationView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//
// This view acts as a wrapper around the LiveCameraRepresentable, which handles live camera input and predictions. When the view appears, it also loads label data from a JSON file to enable object recognition. This view is responsible for displaying real-time predictions by updating the PredictionStatus environment object.

import SwiftUI

struct ClassificationView<Content: View>: View {
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @ObservedObject var classifierViewModel: ClassifierViewModel
    
    let content: () -> Content
    
    var body: some View {
        
        ZStack {
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LiveCameraRepresentable() {
                print("Callback de cámara - Predicción: \($0), Label: \($1), Confianza: \($2)")

                predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .onAppear(perform: classifierViewModel.loadJSON)
        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView(classifierViewModel: ClassifierViewModel()) {
            Text("Hello world!")
        }
            .environmentObject(PredictionStatus())
    }
}
