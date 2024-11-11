//
//  File.swift
//  ExperimentFruitellas
//
//  Created by Adrian Emmanuel Faz Mercado on 10/11/24.
//

import Foundation

struct Object: Identifiable, Codable {
    var label: String = "niente"
    var name: String = "niente"
    var translation: String = "niente"
    var id: String { label }
}
