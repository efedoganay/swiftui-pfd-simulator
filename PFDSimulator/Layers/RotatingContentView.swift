//
//  RotatingContentView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 13.01.2026.
//

import SwiftUI

struct RotatingContentView: View {
    var pitch: CGFloat
    var roll: CGFloat
    
    var body: some View {
        Canvas { context, size in
            let indicatorSize = min(size.width, size.height) * AttitudeLayout.scale
            let inSize = CGSize(width: indicatorSize, height: indicatorSize)
            let pitchOffset = degreeRatios.vertOffset(degree: pitch, indicatorSize: indicatorSize)
            
            context.translateBy(x: size.width / 2, y: size.height / 2)
            
            context.rotate(by: .radians(-roll))
            
            context.translateBy(x: 0, y: pitchOffset)
            
            context.fill(
                Path(AttitudeLayout.skyRect(size: inSize)),
                with: .color(AttitudeLayout.skyColor)
            )
            
            context.fill(
                Path(AttitudeLayout.terrainRect(size: inSize)),
                with: .color(AttitudeLayout.terrainColor)
            )
            
            context.stroke(
                AttitudeLayout.horizonLine(size: inSize),
                with: .color(.white),
                lineWidth: 3
            )
            
            // === Pitch Ladder ===
            for degree in degreeInterval.degrees {
                if degree == 0.0 { continue }
                
                let yPos = -CGFloat(degree) * degreeRatios.vertPixelbyDegree * (indicatorSize / 2)
                let lineWidth = widthRatios.degreeLineWidth(
                    degree: CGFloat(degree),
                    size: inSize
                )
                
                var linePath = Path()
                linePath.move(to: CGPoint(x: -lineWidth / 2, y: yPos))
                linePath.addLine(to: CGPoint(x: lineWidth / 2, y: yPos))
                context.stroke(linePath, with: .color(.white), lineWidth: 2)
            }
        }
    }
}

#Preview {
    RotatingContentView(pitch: 0, roll: 0)
}
