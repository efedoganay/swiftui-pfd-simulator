//
//  PFDLayer.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 14.01.2026.
//
import SwiftUI
import SwiftData

protocol PFDLayer {
    func draw(context: inout GraphicsContext, size: CGSize)
}
