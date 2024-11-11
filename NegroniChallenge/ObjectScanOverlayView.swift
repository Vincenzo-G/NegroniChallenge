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

    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    if let objectFound = objectFound {
                        HStack(spacing: 20) {
                            Image("Camarita").resizable()
                                .scaledToFit()
                                .frame(width: 80)
                            Text("You found a \(objectFound.translation)!")
                                .font(.title2)
                        }
                        
                    } else {
                        Text("Keep searching... 🔍")
                            .font(.title2)
                    }
                }.padding(32)
                    .frame(maxWidth: 500)
                    .background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .shadow(color: .black.opacity(0.2), radius: 16, x: 0, y: 2)
                    .padding(.bottom, 90)
                    Spacer()

            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ObjectScanOverlayView(objectFound: Object(label: "Frigorifero", name: "Frigorifero", translation: "Refrigerator") )
        .background {
            Image("Kitchen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
}
