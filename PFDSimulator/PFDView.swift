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
                
                RotatingContentView(
                    pitch: motionManager.pitch,
                    roll: motionManager.roll
                )
                .frame(width: geo.size.width, height: geo.size.height)
                .mask(
                    RoundedRectangle(cornerRadius: indicatorSize * radiusRatios.skyTerrainCornerRadius)
                        .frame(width: 275, height: 275)
                )
                
                StaticContentView()
                
                HSIContentView(
                    heading: motionManager.heading,
                    geoSize: geo.size
                )
            }
            
        }
    }
}

#Preview {
    PFDView()
        .modelContainer(for: Item.self, inMemory: true)
}
