//
//  MainView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//
// MainView displays details of the recognized object (e.g., name and translation) if one is detected by the camera. It passes the recognized data to ObjectScanOverlayView, which renders it as an overlay in the camera view, allowing users to see the identified object's information directly.


import SwiftUI

struct MainView: View {
    private(set) var labelData: Object
    @ObservedObject var classifierViewModel: ClassifierViewModel
    @State private var labelDataForModal: Object? = nil
    var objectForView: Object? {
        labelData.id == "Niente" ? nil : labelData
    }
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    @EnvironmentObject private var progressTracker: ProgressTracker
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment:.leading, spacing: 25) {
                
                ForEach(levelObjects, id: \.self) { object in
                    Image(object)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 50)
                        .opacity(progressTracker.isStringInCollection(object) ?  1.0 : 0.2)
                        
                }
                
               
            }.padding()
                .background(RoundedRectangle(cornerRadius: 12.0).fill(Color.yellow).shadow(radius: 10))
                

            ObjectScanOverlayView(objectFound: objectForView, levelObjects: levelObjects,
                didTapOpen: didTapOpen(object:))
        }
        .sheet(item: $labelDataForModal, onDismiss: { labelDataForModal = nil }) { object in
            ObjectInfoModal(object: object)
        }
        

        
    }
    func didTapOpen(object: Object) {
        progressTracker.addObject(object)
        labelDataForModal = object
    }
}

#Preview {
    MainView(labelData: Object(label: "niente", name: "niente", translation: "niente"), classifierViewModel: .init())
        .background {
            Image("Kitchen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
        .environmentObject(ProgressTracker())  
}
