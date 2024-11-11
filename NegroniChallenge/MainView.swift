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
    
    
    var body: some View {
        ObjectScanOverlayView(objectFound: objectForView)
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
}
