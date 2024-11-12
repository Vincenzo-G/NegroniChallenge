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
        levelObjects.contains(labelData.id) ? labelData : nil
    }
    var levelObjects : [String] = ["Frigorifero", "Padella", "Forchetta", "Tazza"]
    @EnvironmentObject private var progressTracker: ProgressTracker
    @State var showInstructions: Bool = true
    @State private var showCompletionSheet = false
    
    
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
                .presentationDetents([.medium, .large])
        }
        .sheet(isPresented: $showInstructions) {
            InstructionsView()
        }
        .sheet(isPresented: $showCompletionSheet) {
                    CompletionView()
                }
        .onChange(of: progressTracker.areAllLevelObjectsCollected(levelObjects: levelObjects)) { allDiscovered in
                    if allDiscovered {
                        showCompletionSheet = true
                    }
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
