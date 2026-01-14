//
//  Constants.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 9.01.2026.
//
import SwiftUI
import CoreMotion

enum AttitudeLayout {
    static let scale: CGFloat = 0.7
    static let fixedWindowScale: CGFloat = 0.5
    static let cornerRadiusRatio: CGFloat = 30/275
    
    static let skyColor = Color(red: 0.0, green: 128.0/255.0, blue: 1.0)
    static let terrainColor = Color(red: 128.0/255.0, green: 64.0/255.0, blue: 0.0)

    static func cornerRadius(size: CGSize) -> CGSize {
        CGSize(
            width: size.width * cornerRadiusRatio,
            height: size.height * cornerRadiusRatio
        )
    }

    static func skyRect(size: CGSize) -> CGRect {
        return CGRect(
            x: -size.width / 2,
            y: -size.width / 2,
            width: size.width,
            height: size.width / 2
        )
    }
    static func terrainRect(size: CGSize) -> CGRect {
        return CGRect(
            x: -size.width / 2,
            y: 0,
            width: size.width,
            height: size.width / 2
        )
    }
    static func horizonLine(size: CGSize) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: -size.width / 2, y: 0))
        path.addLine(to: CGPoint(x: size.width / 2, y: 0))
        return path
    }
    
}


enum degreeInterval {
    static let degrees = stride(from: -20.0, to: 22.5, by: 2.5)
}

enum degreeRatios {
    // Her derece = indicator yarı yüksekliğinin %4.25'i
    static let vertPixelbyDegree: CGFloat = 0.0425
    
    /// Indicator boyutu üzerinden dikey offset hesaplar
    /// - Parameters:
    ///   - degree: Derece değeri
    ///   - indicatorSize: Indicator'un bir kenarı (kare olduğu için)
    static func vertOffset(degree: CGFloat, indicatorSize: CGFloat) -> CGFloat {
        return degree * vertPixelbyDegree * (indicatorSize / 2)
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
        let indicatorSize = min(size.width, size.height) * AttitudeLayout.scale
        let centerX = size.width / 2
        let lineWidth = widthRatios.degreeLineWidth(degree: degree, size: CGSize(width: indicatorSize, height: indicatorSize))
        
        return (centerX - lineWidth / 2, centerX + lineWidth / 2)
    }
    
    static func yPos(size: CGSize, degree: CGFloat) -> CGFloat {
        let indicatorSize = min(size.width, size.height) * AttitudeLayout.scale
        let centerY = size.height / 2
        let offset = degreeRatios.vertOffset(degree: degree, indicatorSize: indicatorSize)
        
        return centerY - offset
    }
}
