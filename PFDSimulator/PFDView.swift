//
//  ContentView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//

import SwiftUI
import SwiftData

struct PFDView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            AttitudeIndicator()
            PitchLadder()
        }
    }
}

#Preview {
    PFDView()
        .modelContainer(for: Item.self, inMemory: true)
}
