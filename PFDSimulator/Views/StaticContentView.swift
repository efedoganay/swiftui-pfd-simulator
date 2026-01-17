//
//  StaticContentView.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 14.01.2026.
//

import SwiftUI
import SwiftData

struct StaticContentView: View {
    var body: some View {
        Canvas { context, size in
            context.translateBy(x: size.width/2, y: size.height/2)
            BankAngleScale().draw(context: &context, size: size)
            AircraftSymbol().draw(context: &context, size: size)
        }
    }
}
