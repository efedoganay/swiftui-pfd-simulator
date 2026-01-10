//
//  Item.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
