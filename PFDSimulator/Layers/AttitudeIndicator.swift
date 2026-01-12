//
//  AttitudeIndicator.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI
import SwiftData

struct AttitudeIndicator: View {
    @StateObject private var motionManager = MotionDataProvider()
    var body: some View {
        Canvas { context, size in
            
            let cgSize = CGSize(width: size.width * AttitudeLayout.scale, height: size.height * AttitudeLayout.scale)
            
            let rectSkyRounded = UIBezierPath(
                roundedRect: AttitudeLayout.skyRect(
                    size: cgSize,
                    canvasSize: size
                ),
                byRoundingCorners:[.topLeft, .topRight],
                cornerRadii: CGSize(
                    width: size.width * radiusRatios.skyTerrainCornerRadius,
                    height: size.height * radiusRatios.skyTerrainCornerRadius
                )
            )
            
            context.fill(
                Path(rectSkyRounded.cgPath),
                with:.color(Color(red: 0.0, green: 128.0/255.0, blue: 1.0))
            )
            
            let rectTerrainRounded = UIBezierPath(
                roundedRect: AttitudeLayout.terrainRect(
                    size: cgSize,
                    canvasSize: size
                ),
                byRoundingCorners:[.bottomLeft, .bottomRight],
                cornerRadii: CGSize(
                    width: size.width * radiusRatios.skyTerrainCornerRadius,
                    height: size.height * radiusRatios.skyTerrainCornerRadius
                )
            )
            
            context.fill(
                Path(rectTerrainRounded.cgPath),
                with:.color(Color(red: 128.0/255.0, green: 64.0/255.0, blue: 0.0))
            )
        }
    }
}

#Preview {
    AttitudeIndicator()
        .modelContainer(for: Item.self, inMemory: true)
}
