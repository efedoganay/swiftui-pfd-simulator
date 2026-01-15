//
//  PitchLadder.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI
import SwiftData

struct PitchLadder: View {
    var body: some View {
        Canvas { context, size in
                        
            for degree in degreeInterval.degrees {
                if(degree == 0.0) {continue}
                var linePath = Path()
                linePath.move(to: CGPoint(x: linePos.xPos(size: size, degree: degree).0, y: linePos.yPos(size: size, degree: degree)))
                linePath.addLine(to: CGPoint(x: linePos.xPos(size: size, degree: degree).1, y: linePos.yPos(size: size, degree: degree)))
                context.stroke(linePath, with: .color(.white), lineWidth: 3)
                
                var resolvedText = context.resolve(linePos.degreeText(12345))
                
                context.draw(resolvedText, at: CGPoint(x: 50, y: 50))
    
            }
        }
        .background(Color.black)
    }
}

#Preview {
    PitchLadder()
        .modelContainer(for: Item.self, inMemory: true)
}
