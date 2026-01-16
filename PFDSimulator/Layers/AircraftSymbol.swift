//
//  AircraftSymbol.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 14.01.2026.
//
import SwiftUI
import SwiftData

struct AircraftSymbol: PFDLayer {
    func draw(context: inout GraphicsContext, size: CGSize) {
        let indicatorSize = min(size.width, size.height) * AttitudeLayout.scale
        
        let symbolWidth = AttitudeLayout.acSymbolWidth
        let symbolHeight = AttitudeLayout.acSymbolHeight
        let barHeight = AttitudeLayout.acBarHeight
        let vertBarWidth = AttitudeLayout.acVertBarWidth
        let positionRatio = AttitudeLayout.acPositionRatio
        let top = -barHeight / 2
        
        let rightStart = -indicatorSize/2 + indicatorSize * positionRatio
        let leftStart = -indicatorSize/2 + indicatorSize * (1 - positionRatio)
        
        drawSymbolPair(
            context: &context,
            rightStart: rightStart,
            leftStart: leftStart,
            symbolWidth: symbolWidth,
            symbolHeight: symbolHeight,
            barHeight: barHeight,
            vertBarWidth: vertBarWidth,
            top: top
        )
    }
    
    private func drawSymbolPair(
        context: inout GraphicsContext,
        rightStart: CGFloat,
        leftStart: CGFloat,
        symbolWidth: CGFloat,
        symbolHeight: CGFloat,
        barHeight: CGFloat,
        vertBarWidth: CGFloat,
        top: CGFloat
    ) {
        let rightPath = createRightPath(
            left: rightStart,
            right: rightStart + symbolWidth,
            vertBarX: rightStart + vertBarWidth,
            top: top,
            barHeight: barHeight,
            symbolHeight: symbolHeight
        )
        
        let leftPath = createLeftPath(
            left: leftStart - symbolWidth,
            right: leftStart,
            vertBarX: leftStart - vertBarWidth,
            top: top,
            barHeight: barHeight,
            symbolHeight: symbolHeight
        )
        
        for path in [rightPath, leftPath] {
            context.fill(path, with: .color(.black))
            context.stroke(path, with: .color(.white), lineWidth: 1)
        }
    }
    
    private func createRightPath(
        left: CGFloat,
        right: CGFloat,
        vertBarX: CGFloat,
        top: CGFloat,
        barHeight: CGFloat,
        symbolHeight: CGFloat
    ) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: left, y: top))
        path.addLine(to: CGPoint(x: right, y: top))
        path.addLine(to: CGPoint(x: right, y: top + barHeight))
        path.addLine(to: CGPoint(x: vertBarX, y: top + barHeight))
        path.addLine(to: CGPoint(x: vertBarX, y: top + symbolHeight))
        path.addLine(to: CGPoint(x: left, y: top + symbolHeight))
        path.closeSubpath()
        return path
    }
    
    private func createLeftPath(
        left: CGFloat,
        right: CGFloat,
        vertBarX: CGFloat,
        top: CGFloat,
        barHeight: CGFloat,
        symbolHeight: CGFloat
    ) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: right, y: top))
        path.addLine(to: CGPoint(x: left, y: top))
        path.addLine(to: CGPoint(x: left, y: top + barHeight))
        path.addLine(to: CGPoint(x: vertBarX, y: top + barHeight))
        path.addLine(to: CGPoint(x: vertBarX, y: top + symbolHeight))
        path.addLine(to: CGPoint(x: right, y: top + symbolHeight))
        path.closeSubpath()
        return path
    }
}
