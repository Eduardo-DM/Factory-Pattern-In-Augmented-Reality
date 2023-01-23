//
//  VirtualObjectsFactory.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import Foundation
import RealityKit

final class VirtualObjectsFactory{
    static func buildVirtualObject(typeOfVirtualObject: TypeVirtualObject, view: ARView, anchor: AnchorEntity) -> VirtualObject{
        switch typeOfVirtualObject{
        case .cubeNonGestures:
            return CubeNonGestures(view: view, anchor: anchor)
        case .sphereNonGestures:
            return SphereNonGestures(view: view, anchor: anchor)
        case .cubeWithGestures:
            return CubeWithGestures(view: view, anchor: anchor)
        case .sphereWithGestures:
            return SphereWithGestures(view: view, anchor: anchor)
        }
    }
}
