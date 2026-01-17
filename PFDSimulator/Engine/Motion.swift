//
//  Motion.swift
//  PFDSimulator
//
//  Created by Fikret Efe Doğanay on 11.01.2026.
//

import SwiftUI
import CoreMotion
internal import Combine

class MotionDataProvider: ObservableObject {    
    
    private let motionProvider = CMMotionManager()
    
    @Published var pitch = 0.0
    @Published var yaw = 0.0
    @Published var roll = 0.0
    @Published var heading = 0.0
    
    init() {
        motionProvider.deviceMotionUpdateInterval = 1/50
        motionProvider.startDeviceMotionUpdates(using: .xMagneticNorthZVertical, to: .main) { [weak self] data, error in
            guard let data = data else { return }
            let motion = data.attitude
            
            let rawPitch = (motion.pitch * 180 / .pi)
            self?.pitch = max(-20, min(rawPitch, 30))
            
            let rawRoll = motion.roll * 180 / .pi
            self?.roll = max(-25, min(rawRoll, 25)) * .pi / 180
            
            self?.yaw = motion.yaw * 180 / .pi
            
            self?.heading = data.heading
        }
    }
}
