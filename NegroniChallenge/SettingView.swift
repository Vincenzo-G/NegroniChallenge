//
//  SettingView.swift
//  NegroniChallenge
//
//  Created by Vincenzo Gerelli on 12/11/24.
//

import SwiftUI

struct SettingView: View {
    let settings = ["Kitchen", "Bedroom", "Bathroom", "Classroom"]

    var body: some View {
        VStack(spacing: 20) {
            // Welcome Message
            Text("Welcome, Enzo!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            // Grid Layout for Cards
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 20) {
                ForEach(settings, id: \.self) { setting in
                    SettingCardView(setting: setting)
                }
            }
            
            // Footer with Camera Character and Instruction
            HStack {
                Spacer()
                VStack {
                    HStack {
                        
                        Image("Camarita")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .padding()
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

struct SettingCardView: View {
    let setting: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .frame(height: 150)
                .shadow(radius: 5)
            
            VStack {
                Text(setting)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                HStack {
                    ForEach(0..<3) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.top, 10)
            }
        }
    }
    
}

#Preview {
    SettingView()
}

