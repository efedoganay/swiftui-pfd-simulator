//
//  Constants.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI

enum degreeInterval {
    static let degrees = stride(from: -20.0, to: 17.5, by: 2.5)
}

enum degreeRatios {
    static let vertPixelbyDegree = 0.0425
    
    static func vertOffset(degree: CGFloat, size:CGSize) -> CGFloat {
        vertPixelbyDegree * degree * (size.height/4)
    }
}

enum widthRatios {
    static let widthRatio = 1.0/27.5
    
    static func degreeLineWidth(degree: CGFloat, size: CGSize) -> CGFloat {
        if (degree == 0.0){
            return size.width
        }
        let absDegree = abs(degree)
        var lineWidth: CGFloat = 0.0
                
        if (absDegree.truncatingRemainder(dividingBy: 10.0) == 0){
            lineWidth = widthRatio * 10.0 * size.width
        }
        else if (absDegree.truncatingRemainder(dividingBy: 5.0) == 0){
            lineWidth = widthRatio * 5.0 * size.width
        }
        else if (absDegree.truncatingRemainder(dividingBy: 2.5) == 0){
            lineWidth = widthRatio * 2.5 * size.width
        }
        
        return lineWidth
    }
    
    static let firstLine = 1.0
    
    static let squareReticle = 10.76/275
    static let circleReticleRadius = 22/275
}


enum radiusRatios {
    static let skyTerrainCornerRadius: CGFloat = 30/275
}

enum linePos {
    
    static func xPos(size: CGSize, degree: CGFloat) -> (CGFloat, CGFloat) {
        ((size.width/2) - (widthRatios.degreeLineWidth(degree: degree, size: size) / 2),
        (size.width/2) + (widthRatios.degreeLineWidth(degree: degree, size: size) / 2))
    }
    
    static func yPos(size: CGSize, degree: CGFloat, isNegative: Bool = false) -> CGFloat {
        isNegative ? size.width + degreeRatios.vertOffset(degree: degree, size: size) : size.self.width - degreeRatios.vertOffset(degree: degree, size: size)
    }
    
}
