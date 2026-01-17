//
//  PitchLadder.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI
import SwiftData

struct PitchLadder: PFDLayer {
    var pitch: CGFloat = 0
    
    func draw(context: inout GraphicsContext, size: CGSize) {
        let indicatorSize = min(size.width, size.height) * 0.9
        let inSize = CGSize(width: indicatorSize, height: indicatorSize)
        
        let frameHeight: CGFloat = 275
        let topMargin: CGFloat = 35
        let topLimit = -(frameHeight / 2) + topMargin
        let bottomLimit = frameHeight / 2
        
        let pitchOffset = pitch * degreeRatios.pixelsPerDegree
        
        for degree in degreeInterval.degrees {
            if degree == 0.0 { continue }
            
            let yPos = -CGFloat(degree) * degreeRatios.pixelsPerDegree
            let screenY = yPos + pitchOffset
            
            if screenY < topLimit || screenY > bottomLimit { continue }
            
            let lineWidth = widthRatios.degreeLineWidth(degree: CGFloat(degree), size: inSize)
            
            var linePath = Path()
            linePath.move(to: CGPoint(x: -lineWidth / 2, y: yPos))
            linePath.addLine(to: CGPoint(x: lineWidth / 2, y: yPos))
            context.stroke(linePath, with: .color(.white), lineWidth: 3)
            
            if degree.remainder(dividingBy: 10.0) == 0 {
                let resolvedText = context.resolve(linePos.degreeText(abs(degree)))
                context.draw(resolvedText, at: CGPoint(x: (-lineWidth / 2) - 15, y: yPos + 2))
                context.draw(resolvedText, at: CGPoint(x: (lineWidth / 2) + 15, y: yPos + 2))
            }
        }
    }
}
