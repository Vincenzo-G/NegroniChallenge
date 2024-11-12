//
//  ProgressTracker.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 11/11/24.
//

import Foundation
import Combine

class ProgressTracker: ObservableObject {
    
    @Published private var objectsCollected: Set<String> = []
    
    let allObjects: [Object]
    
    init() {
        if let url = Bundle.main.url(forResource: "mydata", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let list = try decoder.decode([Object].self, from: jsonData)
                
                allObjects = list.filter({ $0.label != "Niente" })
            } catch {
                fatalError("parse error: " + error.localizedDescription)
            }
        } else {
            fatalError("could not find data")
        }
    }
    
    
    func addObject(_ object: Object) {
        objectsCollected.insert(object.label)
    }
    
    func isObjectInCollection(_ object: Object) -> Bool {
        objectsCollected.contains(object.label)
    }
    
    func isStringInCollection(_ objectString: String) -> Bool {
        objectsCollected.contains(objectString)
    }
    
    // Check if all objects in the current level have been collected
    func areAllLevelObjectsCollected(levelObjects: [String]) -> Bool {
        Set(levelObjects).isSubset(of: objectsCollected)
    }
    
}
