//
//  HSI.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 16.01.2026.
//

import SwiftUI
import SwiftData

struct HSI: PFDLayer {
    func draw(context: inout GraphicsContext, size: CGSize) {
        let r = HSILayout.radius
        
        let rect = CGRect(x: -r, y: -r, width: r * 2, height: r * 2)
        let circlePath = Circle().path(in: rect)
        context.fill(circlePath, with: .color(AttitudeLayout.hsiColor))
        
        for degree in stride(from: 0, to: 360, by: 5) {
            let radian = CGFloat(degree) * .pi / 180
            let lineLength: CGFloat = (degree % 10 == 0) ? 18 : 9
            
            let outerX = Darwin.sin(radian) * r
            let outerY = -Darwin.cos(radian) * r
            
            let innerX = Darwin.sin(radian) * (r - lineLength)
            let innerY = -Darwin.cos(radian) * (r - lineLength)
            
            var linePath = Path()
            linePath.move(to: CGPoint(x: outerX, y: outerY))
            linePath.addLine(to: CGPoint(x: innerX, y: innerY))
            
            context.stroke(linePath, with: .color(.white), lineWidth: 2)
            
            if degree % 10 == 0 {
                let fontSize: CGFloat = (degree % 30 == 0) ? 21 : 15
                let textOffset = r - lineLength - 15
                let textX = Darwin.sin(radian) * textOffset
                let textY = -Darwin.cos(radian) * textOffset
                
                let degreeText = Text("\(degree / 10)")
                    .font(.custom("LetterGothicStd-Bold", size: fontSize))
                    .foregroundColor(.white)
                let resolved = context.resolve(degreeText)
                context.draw(resolved, at: CGPoint(x: textX, y: textY))
            }
        }
    }
}
