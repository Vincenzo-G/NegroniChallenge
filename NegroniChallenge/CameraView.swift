//
//  CameraView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//
// This view connects to the classification and prediction functions of the app. It provides the main interface for camera-based object detection by presenting ClassificationView with embedded MainView. It uses a ClassifierViewModel to manage and relay the predictions from the live camera feed.

import SwiftUI

struct CameraView: View {
    @EnvironmentObject private var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    
    var body: some View {
        ClassificationView(classifierViewModel: classifierViewModel) {
            MainView(
                labelData: classifierViewModel.getPredictionData(label: predictionStatus.topLabel),
                classifierViewModel: classifierViewModel,
                levelObjects: levelObjects
            )
            
        }
        
    }
}

/*
#Preview {
    CameraView()
}

*/
