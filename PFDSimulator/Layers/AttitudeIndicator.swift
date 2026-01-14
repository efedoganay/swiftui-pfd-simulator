//
//  AttitudeIndicator.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI
import SwiftData

struct AttitudeIndicator: View {
    @StateObject private var motionManager = MotionDataProvider()
    
    var body: some View {
        Canvas { context, size in
            
            context.translateBy(x: size.width/2, y: size.height/2)
            
            let inSize = CGSize(
                width: size.width * AttitudeLayout.scale,
                height: size.height * AttitudeLayout.scale
            )
            let indicatorSize = min(size.width, size.height) * AttitudeLayout.scale
            let maxOffset = AttitudeLayout.maxPitchOffset(indicatorSize: indicatorSize)
            
            context.fill(
                Path(AttitudeLayout.skyRect(size: inSize, maxOffset: maxOffset)),
                with:.color(AttitudeLayout.skyColor)
            )
            
            context.fill(
                Path(AttitudeLayout.terrainRect(size: inSize, maxOffset: maxOffset)),
                with:.color(AttitudeLayout.terrainColor)
            )
            
            context.stroke(AttitudeLayout.horizonLine(size: inSize),
                           with: .color(.white),
                           lineWidth: 3
            )
        }
        .background(Color.green)
        
        
    }
}

#Preview {
    AttitudeIndicator()
        .modelContainer(for: Item.self, inMemory: true)
}
