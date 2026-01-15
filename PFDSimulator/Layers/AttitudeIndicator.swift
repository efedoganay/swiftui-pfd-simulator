//
//  AttitudeIndicator.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI
import SwiftData

struct AttitudeIndicator: PFDLayer {
    
    func draw(context: inout GraphicsContext, size: CGSize) {
        let indicatorSize = min(size.width, size.height) * 0.9
        let inSize = CGSize(width: indicatorSize, height: indicatorSize)
        let maxOffset = AttitudeLayout.maxPitchOffset(indicatorSize: indicatorSize)
        
        // Sky
        context.fill(
            Path(AttitudeLayout.skyRect(size: inSize, maxOffset: maxOffset)),
            with: .color(AttitudeLayout.skyColor)
        )
        
        // Terrain
        context.fill(
            Path(AttitudeLayout.terrainRect(size: inSize, maxOffset: maxOffset)),
            with: .color(AttitudeLayout.terrainColor)
        )
        
        // Horizon Line
        context.stroke(
            AttitudeLayout.horizonLine(size: inSize),
            with: .color(.white),
            lineWidth: 3
        )
    }
}
