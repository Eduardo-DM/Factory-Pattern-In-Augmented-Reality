//
//  ARCoaching.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 27/1/23.
//

import Foundation
import RealityKit
import ARKit

extension ARView: ARCoachingOverlayViewDelegate {
    
    func addCoaching() {
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.goal = .horizontalPlane
        coachingOverlay.session = self.session
        coachingOverlay.delegate = self
        self.addSubview(coachingOverlay)
    }
    
}
