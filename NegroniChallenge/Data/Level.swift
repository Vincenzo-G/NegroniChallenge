//
//  Level.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 13/11/24.
//

import Foundation

struct Level {
    let objects: [Object]
    var isCompleted: Bool = false
}

struct Place {
    let name: String
    var currentLevel: Int = 1
    let levels: [Level]
}




