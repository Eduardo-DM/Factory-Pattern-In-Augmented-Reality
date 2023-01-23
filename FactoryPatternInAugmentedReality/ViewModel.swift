//
//  ViewModel.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    @Published var typeVirtualObject = TypeVirtualObject.cubeNonGestures
    @Published var isVirtualObjectCreated = false
    @Published var myObjects:[VirtualObject] = []
    
    func deleteObject(){
        isVirtualObjectCreated = false
        myObjects.removeAll()
    }
    
    func changeHigh(deltaHigh: Float = 0.1)
    {
        if myObjects.count > 0{
            myObjects[0].updateHigh(deltaHigh)
        }
    }
    
    func changeColor(){
        if myObjects.count > 0{
            myObjects[0].updateColor(UIColor(displayP3Red:.random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1))
        }
    }
}
