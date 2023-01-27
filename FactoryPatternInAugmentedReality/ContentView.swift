//
//  ContentView.swift
//  FactoryPatternInAugmentedReality
//
//  Created by Eduardo Developer on 23/1/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ZStack{
            ARViewContainer().edgesIgnoringSafeArea(.all).environmentObject(viewModel)
            SwiftUIView(viewModel: viewModel)
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    @EnvironmentObject var environmentViewModel: ViewModel
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.name = "Plane Anchor"
        arView.scene.addAnchor(anchor)
        arView.addCoaching()
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(CoordinatorARSession.handleTap)))
        context.coordinator.view = arView
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> CoordinatorARSession {
        CoordinatorARSession(parent: self)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
