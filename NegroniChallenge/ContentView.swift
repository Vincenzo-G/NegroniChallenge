//
//  ContentView.swift
//  NegroniChallenge
//
//  Created by Vincenzo Gerelli on 11/11/24.
//
// Main screen of the app, where users first interact. It provides a simple interface with a welcome message and a button that initiates the camera view. When the button is tapped, it triggers navigation to CameraView, which starts the object recognition process.


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "applelogo")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, fruitellas!")
                
                NavigationLink {
                    CameraView()
                } label: {
                    Text("Abre camarita loca")
                        .buttonStyle(.bordered)
                }
            }
            .padding()
        }
    }

}

#Preview {
    ContentView()
}
