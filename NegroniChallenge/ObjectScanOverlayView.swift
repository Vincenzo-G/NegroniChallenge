//
//  ObjectScanOverlayView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//

import SwiftUI

struct ObjectScanOverlayView: View {
    
    var objectFound: Object?
    @EnvironmentObject var predictionStatus: PredictionStatus
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    let didTapOpen: (Object) -> Void

    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    if let objectFound = objectFound {
                        HStack(spacing: 20) {

                            Text("Hey! You found something! 🤩")
                                .font(.title3)
                                .padding()
                                .background()
                                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                .listRowSeparator(.hidden)
                                .overlay(alignment: .bottomTrailing) {
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .font(.title)
                                        .rotationEffect(.degrees(-45))
                                        .offset(x: 10, y: 10)
                                        .foregroundStyle(.white)
                                }
                            Image("Camarita").resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .offset(x: 0, y: 40)
                        }.offset(y:10)
                        
                        
                        
                    } else {
                        HStack {
                            Image("CamaritaLeft")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .offset(x: 0, y: 40)
                            
                            
                            
                            
                            VStack {
                                Text("Keep searching! 🔎")
                                    .font(.title3)
                                    .padding()
                                    .background()
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                    .listRowSeparator(.hidden)
                                    .overlay(alignment: .bottomLeading) {
                                        Image(systemName: "arrowtriangle.down.fill")
                                            .font(.title)
                                            .rotationEffect(.degrees(45))
                                            .offset(x: -10, y: 10)
                                            .foregroundStyle(.white)
                                    }
                            }
                            
                                
                            

                        }

                    }
                    
                    if let object = objectFound {
                        
                        HStack {
                            Button("Discover it!", action: { didTapOpen(object) })
                                .padding(10)
                                .background(LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 1.0, green: 0.80, blue: 0), // Top color (slightly darker yellow)
                                        Color.orange // Bottom color (current yellow)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                ))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                
                                .controlSize(.large)
                                .font(.system(.headline, design: .rounded, weight: .semibold))
                                .foregroundStyle(.white)
                                .offset(x:35)
                               
                            
                            Spacer()
                        }
                        
                    }
                }.padding(26)
                    .frame(maxWidth: 550)
                    //.background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 2)
                    .padding(.bottom, 90)
                    Spacer()

            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    ObjectScanOverlayView(objectFound: Object(label: "Frigorifero", name: "Frigorifero", translation: "Refrigerator"), didTapOpen: {_ in})
        .background {
            Image("Kitchen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
}
