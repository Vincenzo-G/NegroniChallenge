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
    @Published var currentLevelByPlace: [String: Int] = [
        "Kitchen": 1,
        "Bathroom": 1,
        "Classroom": 1,
        "Bedroom": 1
    ]
    
    // Define the places with the respective objects of each level.
    let places: [String: [[String]]] = [
        "Kitchen": [
            ["Tazza", "Forchetta", "Frigorifero", "Padella"],         // Level 1
            ["Glass", "Cup", "Bowl", "Pan"],             // Level 2
            ["Oven", "Stove", "Fridge", "Blender"]       // Level 3
        ],
        "Classroom": [
            ["Toothbrush", "Soap", "Towel", "Mirror"], // Level 1
            ["Shampoo", "Conditioner", "Toilet", "Sink"], // Level 2
            ["Bathtub", "Razor", "ToiletPaper", "Mat"] // Level 3
        ],
        "Bedroom": [
            ["Spoon", "Fork", "Knife", "Plate"],         // Level 1
            ["Glass", "Cup", "Bowl", "Pan"],             // Level 2
            ["Oven", "Stove", "Fridge", "Blender"]       // Level 3
        ],
        "Bathroom": [
            ["Spoon", "Fork", "Knife", "Plate"],         // Level 1
            ["Glass", "Cup", "Bowl", "Pan"],             // Level 2
            ["Oven", "Stove", "Fridge", "Blender"]       // Level 3
        ]
    ]
    
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
    
    // Get the list of names of objects corresponding to the level.
    func getCurrentObjectNames(for placeName: String) -> [String]? {
        guard let levels = places[placeName],
              let currentLevel = currentLevelByPlace[placeName] else { return nil }
        return levels[safe: currentLevel - 1]
    }
    
    // Advance the level of a setting depending on whether he/she completed the level or not.
    func advanceLevel(for placeName: String) {
        guard let maxLevel = places[placeName]?.count,
              let currentLevel = currentLevelByPlace[placeName] else { return }
        
        if currentLevel < maxLevel {
            currentLevelByPlace[placeName] = currentLevel + 1
        } else {
            print("\(placeName) is already at the top level!")
        }
    }
    
    func getPercentage(for placeName: String) -> Double {
        
        switch currentLevelByPlace[placeName] {
        case 1:
            return 0.0
        case 2:
            return 0.33
        case 3:
            return 0.66
        case 4:
            return 1.0
        default:
            return 0.0
            
        }
        
    }
    
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
