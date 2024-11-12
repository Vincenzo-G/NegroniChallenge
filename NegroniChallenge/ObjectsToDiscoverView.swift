//
//  ObjectsToDiscoverView.swift
//  NegroniChallenge
//
//  Created by Adrian Emmanuel Faz Mercado on 12/11/24.
//

import SwiftUI

struct ObjectsToDiscoverView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Today's Mission")
        
        Button {
            dismiss()
            dismiss()
        } label: {
            Text("START")
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 10))
                
        }
    }
}

#Preview {
    ObjectsToDiscoverView()
}
