//
//  File.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//
// This class handles the state of live prediction results. It stores the latest prediction data, including the recognized label and confidence level. This shared state is accessible throughout the app, enabling consistent updates and display of the prediction information across views.


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
        
    }
}
