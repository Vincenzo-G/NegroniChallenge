//
//  MainView.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//

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
