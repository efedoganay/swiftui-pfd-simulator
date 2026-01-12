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
    
    init() {
        motionProvider.deviceMotionUpdateInterval = 1/50
        motionProvider.startDeviceMotionUpdates(to:.main) {[weak self] data, error in
            guard let motion = data?.attitude else { return }
            self?.pitch = motion.pitch
            self?.yaw = motion.yaw
            self?.roll = motion.roll
        }
    }
}
