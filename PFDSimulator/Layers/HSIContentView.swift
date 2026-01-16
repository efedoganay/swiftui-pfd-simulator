//
//  HSIContentView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 16.01.2026.
//

import SwiftUI

struct HSIContentView: View {
    var heading: CGFloat
    var geoSize: CGSize
    
    var body: some View {
        Canvas { context, size in
            let centerX = size.width / 2
            
            context.translateBy(x: centerX, y: HSILayout.radius + 20)
            context.rotate(by: .degrees(-heading))
            HSI(heading: heading).draw(context: &context, size: size)
            
            context.rotate(by: .degrees(heading))
            
            let pointerTop = -HSILayout.radius + 21
            
            var pointerPath = Path()
            pointerPath.move(to: CGPoint(x: 0, y: pointerTop))
            pointerPath.addLine(to: CGPoint(x: 0, y: -HSILayout.radius + 80))
            context.stroke(pointerPath, with: .color(.white), lineWidth: 2)
            
            var horizontalPath = Path()
            horizontalPath.move(to: CGPoint(x: -8, y: pointerTop + 24))
            horizontalPath.addLine(to: CGPoint(x: 8, y: pointerTop + 24))
            context.stroke(horizontalPath, with: .color(.white), lineWidth: 2)
            
            let triangleWidth: CGFloat = 23
            let triangleHeight: CGFloat = 19
            let triangleTip = -HSILayout.radius
            
            var trianglePath = Path()
            trianglePath.move(to: CGPoint(x: 0, y: triangleTip))
            trianglePath.addLine(to: CGPoint(x: -triangleWidth / 2, y: triangleTip - triangleHeight))
            trianglePath.addLine(to: CGPoint(x: triangleWidth / 2, y: triangleTip - triangleHeight))
            trianglePath.closeSubpath()
            
            context.stroke(trianglePath, with: .color(.white), lineWidth: 2)
        }
        .frame(width: 315, height: 100)
        .clipped()
        .position(
            x: geoSize.width / 2,
            y: geoSize.height / 2 + HSILayout.topPadding + 10
        )
    }
}

#Preview {
    HSIContentView(heading: 0, geoSize: CGSize(width: 400, height: 800))
}
