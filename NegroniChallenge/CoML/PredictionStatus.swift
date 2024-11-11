//
//  File.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//

import Foundation
import SwiftUI
import Vision

class PredictionStatus: ObservableObject {
    // TODO - replace with the name of your classifier
    @Published var modelObject = Experiment()
    @Published var topLabel = ""
    @Published var topConfidence = ""
    
    // Live prediction results
    @Published var livePrediction: LivePredictionResults = [:]
    
    func setLivePrediction(with results: LivePredictionResults, label: String, confidence: String) {
        livePrediction = results
        topLabel = label
        topConfidence = confidence
        print("setLivePrediction llamado - Label: \(label), Confianza: \(confidence)")
    }
}
