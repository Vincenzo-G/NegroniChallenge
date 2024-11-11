//
//  CameraView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//


import SwiftUI

struct CameraView: View {
    @EnvironmentObject private var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        ClassificationView(classifierViewModel: classifierViewModel) {
            MainView(
                labelData: classifierViewModel.getPredictionData(label: predictionStatus.topLabel),
                classifierViewModel: classifierViewModel
            )
            
        }
        
    }
}

/*
#Preview {
    CameraView()
}

*/
