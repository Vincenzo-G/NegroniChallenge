//
//  ContentView.swift
//  NegroniChallenge
//
//  Created by Vincenzo Gerelli on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var didTapStart = false
    var body: some View {
    
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button {
                    didTap()
                } label: {
                    Text("Abre camarita")
                } .buttonStyle(.bordered)
            }
            .padding()
            .navigationDestination(isPresented: $didTapStart) {
                CameraView()
            }

    }
    func didTap() {
        didTapStart = true
    }
}

#Preview {
    ContentView()
}
