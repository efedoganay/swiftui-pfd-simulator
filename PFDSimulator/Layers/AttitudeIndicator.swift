//
//  AttitudeIndicator.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI

struct AttitudeIndicator: View {
    var body: some View {
        Canvas { context, size in
            
            let rectSkyRounded = UIBezierPath(roundedRect: CGRect(x: 0, y: size.width/2, width: size.width, height: size.width/2), byRoundingCorners:[.topLeft, .topRight], cornerRadii: CGSize(width: size.width * radiusRatios.skyTerrainCornerRadius, height: size.height * radiusRatios.skyTerrainCornerRadius))
            
            context.fill(Path(rectSkyRounded.cgPath), with:.color(Color(red: 0.0, green: 128.0/255.0, blue: 1.0)))
            
            let rectTerrainRounded = UIBezierPath(roundedRect: CGRect(x: 0, y: size.width, width: size.width, height: size.width/2), byRoundingCorners:[.bottomLeft, .bottomRight], cornerRadii: CGSize(width: size.width * radiusRatios.skyTerrainCornerRadius, height: size.height * radiusRatios.skyTerrainCornerRadius))
            
            context.fill(Path(rectTerrainRounded.cgPath), with:.color(Color(red: 128.0/255.0, green: 64.0/255.0, blue: 0.0)))

        }
    }
}
