//
//  VirtualObject.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import Foundation
import RealityKit
import UIKit

protocol VirtualObject{
    var object: ModelEntity{get}
    func updateColor(_ newColor: UIColor)
    func updateHigh(_ newHigh: Float)
}

extension VirtualObject{
    
    func updateColor(_ newColor: UIColor){
        let newColorMaterial = SimpleMaterial(color: newColor, isMetallic: true)
        object.model?.materials = [newColorMaterial]
    }
    
    func updateHigh(_ deltaHigh: Float){
        let newHigh = object.position.y + deltaHigh
        //Constraint to avoid virtual object go bellow 0 height
        guard newHigh >= 0 else {return}
        object.position.y = newHigh
    }
}
