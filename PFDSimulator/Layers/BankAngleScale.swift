//
//  BankAngleScale.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 16.01.2026.
//

import SwiftUI

struct BankAngleScale: PFDLayer {
    func draw(context: inout GraphicsContext, size: CGSize) {
        let frameSize: CGFloat = 275
        let centerTipTarget = -frameSize / 2 + 6 // -131.5
        let centerTickLength: CGFloat = 12
        let baseRadius = -centerTipTarget - centerTickLength // 119.5
        
        let bankAngles: [(degree: Int, length: CGFloat)] = [
            (10, 12),
            (20, 12),
            (30, 24),
            (45, 12),
            (60, 24)
        ]
        
        drawBankTick(context: &context, angle: 0, radius: baseRadius, length: centerTickLength)
        
        for (degree, length) in bankAngles {
            drawBankTick(context: &context, angle: degree, radius: baseRadius, length: length)
            drawBankTick(context: &context, angle: -degree, radius: baseRadius, length: length)
        }
        
        drawTopTriangle(context: &context, tipTarget: centerTipTarget)
    }
    
    private func drawBankTick(context: inout GraphicsContext, angle: Int, radius: CGFloat, length: CGFloat) {
        let radian = CGFloat(angle) * .pi / 180
        
        // Starts at radius (inner) and grows to radius + length (outer)
        let innerX = Darwin.sin(radian) * radius
        let innerY = -Darwin.cos(radian) * radius
        
        let outerX = Darwin.sin(radian) * (radius + length)
        let outerY = -Darwin.cos(radian) * (radius + length)
        
        var path = Path()
        path.move(to: CGPoint(x: innerX, y: innerY))
        path.addLine(to: CGPoint(x: outerX, y: outerY))
        
        context.stroke(path, with: .color(.white), lineWidth: 2)
    }
    
    private func drawTopTriangle(context: inout GraphicsContext, tipTarget: CGFloat) {
        let topTriangleWidth: CGFloat = 21
        let topTriangleHeight: CGFloat = 10
        
        var topTriangle = Path()
        topTriangle.move(to: CGPoint(x: 0, y: tipTarget + topTriangleHeight))
        topTriangle.addLine(to: CGPoint(x: -topTriangleWidth / 2, y: tipTarget))
        topTriangle.addLine(to: CGPoint(x: topTriangleWidth / 2, y: tipTarget))
        topTriangle.closeSubpath()
        context.fill(topTriangle, with: .color(.white))
    }
}
