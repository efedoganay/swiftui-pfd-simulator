//
//  BankAnglePointerView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 16.01.2026.
//

import SwiftUI

struct BankAnglePointerView: View {
    var roll: CGFloat
    
    var body: some View {
        Canvas { context, size in
            context.translateBy(x: size.width / 2, y: size.height / 2)
            context.rotate(by: .radians(-roll))
            BankAnglePointer().draw(context: &context, size: size)
        }
    }
}
