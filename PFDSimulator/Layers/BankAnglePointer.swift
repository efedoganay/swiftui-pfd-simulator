//
//  BankAnglePointer.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 16.01.2026.
//

import SwiftUI

struct BankAnglePointer: PFDLayer {
    func draw(context: inout GraphicsContext, size: CGSize) {
        let frameSize: CGFloat = 275
        let centerTipTarget = -frameSize / 2 + 6 // -131.5
        let topTriangleHeight: CGFloat = 10
        let topTriangleBottom = centerTipTarget + topTriangleHeight // -121.5
        
        let pointerApex = topTriangleBottom + 2 // -119.5
        let smallTriHeight: CGFloat = 8
        let gapHeight: CGFloat = 1
        let trapezoidHeight: CGFloat = 4
        let totalHeight = smallTriHeight + gapHeight + trapezoidHeight // 13
        let finalWidth: CGFloat = 29
        
        // Slope: width grows from 0 to finalWidth over totalHeight
        func widthAt(yOffset: CGFloat) -> CGFloat {
            return (yOffset / totalHeight) * finalWidth
        }
        
        let smallTriBaseY = pointerApex + smallTriHeight
        let smallTriBaseWidth = widthAt(yOffset: smallTriHeight)
        
        // 1. Small Triangle (Top part)
        var smallTriangle = Path()
        smallTriangle.move(to: CGPoint(x: 0, y: pointerApex))
        smallTriangle.addLine(to: CGPoint(x: -smallTriBaseWidth / 2, y: smallTriBaseY))
        smallTriangle.addLine(to: CGPoint(x: smallTriBaseWidth / 2, y: smallTriBaseY))
        smallTriangle.closeSubpath()
        context.fill(smallTriangle, with: .color(.white))
        
        // 2. Trapezoid (Bottom part)
        let trapezoidTopY = smallTriBaseY + gapHeight
        let trapezoidTopWidth = widthAt(yOffset: smallTriHeight + gapHeight)
        let trapezoidBottomY = trapezoidTopY + trapezoidHeight
        let trapezoidBottomWidth = finalWidth
        
        var trapezoid = Path()
        trapezoid.move(to: CGPoint(x: -trapezoidTopWidth / 2, y: trapezoidTopY))
        trapezoid.addLine(to: CGPoint(x: trapezoidTopWidth / 2, y: trapezoidTopY))
        trapezoid.addLine(to: CGPoint(x: trapezoidBottomWidth / 2, y: trapezoidBottomY))
        trapezoid.addLine(to: CGPoint(x: -trapezoidBottomWidth / 2, y: trapezoidBottomY))
        trapezoid.closeSubpath()
        context.fill(trapezoid, with: .color(.white))
    }
}
