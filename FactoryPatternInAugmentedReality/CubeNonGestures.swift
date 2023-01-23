//
//  CubeNonGestures.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import Foundation
import RealityKit

final class CubeNonGestures:VirtualObject{
    
    var object: ModelEntity
    
    init(view: ARView, anchor: AnchorEntity){
        let material = SimpleMaterial(color: .yellow, isMetallic: true)
        object = ModelEntity(mesh: MeshResource.generateBox(size: 0.2), materials: [material])
        anchor.addChild(object)
        view.scene.addAnchor(anchor)
    }
    deinit{
        object.removeFromParent(preservingWorldTransform: true)
    }
    
}
