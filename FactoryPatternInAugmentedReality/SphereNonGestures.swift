//
//  SphereNonGestures.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import Foundation
import RealityKit

final class SphereNonGestures:VirtualObject{
    
    var object: ModelEntity
    
    init(view: ARView, anchor: AnchorEntity){
        let material = SimpleMaterial(color: .yellow, isMetallic: true)
        object = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.1), materials: [material])
        anchor.addChild(object)
        view.scene.addAnchor(anchor)
    }
    deinit{
        object.removeFromParent(preservingWorldTransform: true)
    }
}
