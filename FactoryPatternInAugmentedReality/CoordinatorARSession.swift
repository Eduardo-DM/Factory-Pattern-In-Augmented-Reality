//
//  CoordinatorARSession.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import Foundation
import ARKit
import RealityKit


final class CoordinatorARSession: NSObject{
    
    var parent: ARViewContainer
    
    weak var view: ARView?
    
    init(parent: ARViewContainer) {
        self.parent = parent
    }
    
    @objc func handleTap(_ recognizer: UITapGestureRecognizer){
        
        guard let view = self.view else{
            return
        }
        
        if parent.environmentViewModel.myObjects.count == 1 {
            return
        }
        
        let tapLocation = recognizer.location(in: view)
        
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        if let result = results.first{
            
            let anchorRayCast = AnchorEntity(raycastResult: result)

            parent.environmentViewModel.isVirtualObjectCreated = true
            parent.environmentViewModel.myObjects.append(VirtualObjectsFactory.buildVirtualObject(typeOfVirtualObject: parent.environmentViewModel.typeVirtualObject, view: view, anchor: anchorRayCast))
        }
    }
}
