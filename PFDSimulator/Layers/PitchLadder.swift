//
//  PitchLadder.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI

struct PitchLadder: View {
    var body: some View {
        Canvas { context, size in
            
            for degree in degreeInterval.degrees {
                var linePath = Path()
                linePath.move(to: CGPoint(x: linePos.xPos(size: size, degree: degree).0, y: linePos.yPos(size: size, degree: degree)))
                linePath.addLine(to: CGPoint(x: linePos.xPos(size: size, degree: degree).1, y: linePos.yPos(size: size, degree: degree)))
                context.stroke(linePath, with: .color(.white), lineWidth: 3)
    
            }
        }
    }
}
