//
//  ButtonCapsuleBorderProminentModifier.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import SwiftUI

struct ButtonCapsuleBorderProminentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
    }
}
