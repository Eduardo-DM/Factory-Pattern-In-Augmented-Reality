//
//  SwiftUIView.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import SwiftUI

struct SwiftUIView: View {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        if !viewModel.isVirtualObjectCreated {
            SetTypeVirtualObject()
                .padding()
        }else{
            ChangeVirtualObject()
                .padding()
        }
    }
    
    @ViewBuilder func ChangeVirtualObject()->some View {
        VStack(alignment: .center, spacing: 20){
            Spacer()
            HStack{
                VStack{
                    Button("Up") {
                        viewModel.changeHigh()
                    }
                    .modifier(ButtonCapsuleBorderProminentModifier())
                    Button("Down") {
                        viewModel.changeHigh(deltaHigh: -0.1)
                    }
                    .modifier(ButtonCapsuleBorderProminentModifier())
                }
                Spacer()
                Button {
                    viewModel.changeColor()
                } label: {
                    Text("Change color")
                }
                .modifier(ButtonCapsuleBorderProminentModifier())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            HStack{
                Spacer()
                Button(role: .destructive) {
                    viewModel.deleteObject()
                } label: {
                    Text("Delete object")
                }
                .modifier(ButtonCapsuleBorderProminentModifier())
            }
        }
    }
    
    @ViewBuilder func SetTypeVirtualObject()->some View {
        VStack{
            Spacer()
            Picker("Choose type of virtual object", selection: $viewModel.typeVirtualObject) {
                Text("Cube without gestures").tag(TypeVirtualObject.cubeNonGestures)
                Text("Cube with gestures").tag(TypeVirtualObject.cubeWithGestures)
                Text("Sphere without gestures").tag(TypeVirtualObject.sphereNonGestures)
                Text("Sphere with gestures").tag(TypeVirtualObject.sphereWithGestures)
            }
            .padding(8)
            .background(.thinMaterial)
            .mask { RoundedRectangle(cornerRadius: 10, style: .continuous) }
            .pickerStyle(.menu)
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(viewModel: ViewModel())
    }
}

