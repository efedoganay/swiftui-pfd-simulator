//
//  HSIContentView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 16.01.2026.
//

import SwiftUI

struct HSIContentView: View {
    var yaw: CGFloat
    var geoSize: CGSize
    
    var body: some View {
        Canvas { context, size in
            context.translateBy(x: size.width / 2, y: HSILayout.radius)
            context.rotate(by: .radians(-yaw))
            HSI().draw(context: &context, size: size)
        }
        .frame(width: 315, height: 80)
        .clipped()
        .position(
            x: geoSize.width / 2,
            y: geoSize.height / 2 + HSILayout.topPadding
        )
    }
}

#Preview {
    HSIContentView(yaw: 0, geoSize: CGSize(width: 400, height: 800))
}
