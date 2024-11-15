//
//  NegroniChallengeApp.swift
//  NegroniChallenge
//
//  Created by Vincenzo Gerelli on 11/11/24.
//
// Entry point of the app, sets up the main App structure. It initializes a shared PredictionStatus environment object, which is used to store the results of object recognition predictions made by the camera. The app begins with ContentView, where users can navigate to interact with the app's core features.

import SwiftUI

@main
struct NegroniChallengeApp: App {
    @StateObject private var predictionStatus = PredictionStatus()
    @StateObject private var progressTracker = ProgressTracker()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                WelcomeView()
            }.environmentObject(predictionStatus)
             .environmentObject(progressTracker)
           
        }
    }
}
