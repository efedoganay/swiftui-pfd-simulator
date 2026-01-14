//
//  ContentView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//

import SwiftUI
import SwiftData

struct PFDView: View {
    @StateObject private var motionManager = MotionDataProvider()
    
    var body: some View {
        GeometryReader { geo in
            let indicatorSize = min(geo.size.width, geo.size.height) * AttitudeLayout.fixedWindowScale
            
            ZStack {
                Color.black.ignoresSafeArea()
                
                // Dönen içerik - pitch/roll tek yerden uygulanıyor
                RotatingContentView(
                    pitch: motionManager.pitch,
                    roll: motionManager.roll
                )
                .frame(width: geo.size.width, height: geo.size.height)
                // Sabit mask penceresi
                .mask(
                    RoundedRectangle(cornerRadius: indicatorSize * radiusRatios.skyTerrainCornerRadius)
                        .frame(width: indicatorSize, height: indicatorSize)
                )
            }
        }
    }
}

#Preview {
    PFDView()
        .modelContainer(for: Item.self, inMemory: true)
}
