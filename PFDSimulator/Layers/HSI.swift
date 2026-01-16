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
        let r: CGFloat = HSILayout.radius
        let rect = CGRect(x: -r, y: -r, width: r * 2, height: r * 2)
        let path = Circle().path(in: rect)
        context.fill(path, with: .color(AttitudeLayout.hsiColor))
    }
    
    
}
