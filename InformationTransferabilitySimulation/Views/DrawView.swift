//
//  DrawView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/21.
//

import SwiftUI
import PencilKit

struct PenKitView:UIViewRepresentable {
   typealias UIViewType = PKCanvasView
    let toolPicker = PKToolPicker()
   
   func makeUIView(context: Context) -> PKCanvasView {
       let pkcView = PKCanvasView()
       pkcView.drawingPolicy = PKCanvasViewDrawingPolicy.anyInput
       toolPicker.addObserver(pkcView)
//       toolPicker.setVisible(true, forFirstResponder: pkcView)
       pkcView.becomeFirstResponder()
       
       return pkcView
   }
   
   func updateUIView(_ uiView: PKCanvasView, context: Context) {
   }
   
}
