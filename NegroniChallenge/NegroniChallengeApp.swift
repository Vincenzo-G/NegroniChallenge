//
//  NegroniChallengeApp.swift
//  NegroniChallenge
//
//  Created by Vincenzo Gerelli on 11/11/24.
//

import SwiftUI

@main
struct NegroniChallengeApp: App {
    @StateObject private var predictionStatus = PredictionStatus()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            } .environmentObject(predictionStatus)
           
        }
    }
}
