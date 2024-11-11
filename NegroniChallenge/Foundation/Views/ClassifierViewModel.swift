//
//  ClassifierViewModel.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//
// This file manages the data used for classification by loading label information from a JSON file (mydata.json). It provides methods to filter and retrieve prediction data based on a recognized label. The classifier data is used to match the prediction labels to their names and translations, which are then displayed in the app.

import Foundation

final class ClassifierViewModel: ObservableObject {
    @Published var classifierData: [Object] = []
    @Published var dataWhenAboutTapped:Int = 0
    @Published var classifierLabels: [String: Bool] = [:]

    
    func loadJSON() {
        print("load JSON")
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                classifierData = try decoder.decode([Object].self, from: jsonData)
                
                for labelData in classifierData {
                    classifierLabels[labelData.label] = false
                    print(labelData)
                }
                
            } catch {
                print("ERROR LOCO")
                print(error)
            }
        } else {
            print("could not find data")
        }
 
    }
    
    func getPredictionData(label: String) -> Object {
        print("ME LLAMARON!")
        return classifierData.filter { $0.label == label }.first ?? Object()
    }
}
