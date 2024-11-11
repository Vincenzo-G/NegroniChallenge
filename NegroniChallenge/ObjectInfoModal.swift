//
//  ObjectInfoModal.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 11/11/24.
//

import SwiftUI

struct ObjectInfoModal: View {
    var object: Object = .init()
    var body: some View {
        Text(object.label)
        Text(object.translation)
    }
}

#Preview {
    ObjectInfoModal()
}
