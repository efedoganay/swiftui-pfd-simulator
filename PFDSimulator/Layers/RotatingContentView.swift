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
    
    var layers: [PFDLayer] = [AttitudeIndicator(), PitchLadder()]
    
    var body: some View {
                
        Canvas { context, size in
            let indicatorSize = min(size.width, size.height) * 0.9
            let pitchOffset = degreeRatios.vertOffset(degree: pitch, indicatorSize: indicatorSize)
            
            context.translateBy(x: size.width / 2, y: size.height / 2)
            
            context.rotate(by: .radians(-roll))
            
            context.translateBy(x: 0, y: pitchOffset)
            
            for layer in layers {
                layer.draw(context: &context, size: size)
            }
        }
    }
}

#Preview {
    RotatingContentView(pitch: 0, roll: 0)
}
