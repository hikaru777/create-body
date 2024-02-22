//
//  SliderView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/17.
//

import SwiftUI

struct SliderView: View {
    
    @ObservedObject var viewModel: viewModel
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Circle().foregroundStyle(.blue)
                    .frame(width: 10, height: 10)
                
                Slider(value: $viewModel.value0, in: 0...100)
                    .frame(width: 300)
                
                Text(String(Int(viewModel.value0)))
                    .frame(width: 30)
                Text("%")
            }
            HStack {
                
                Circle().foregroundStyle(.green)
                    .frame(width: 10, height: 10)
                
                Slider(value: $viewModel.value1, in: 0...100)
                    .frame(width: 300)
                
                Text(String(Int(viewModel.value1)))
                    .frame(width: 30)
                Text("%")
            }
            HStack {
                
                Circle().foregroundStyle(.orange)
                    .frame(width: 10, height: 10)
                
                Slider(value: $viewModel.value2, in: 0...100)
                    .frame(width: 300)
                
                Text(String(Int(viewModel.value2)))
                    .frame(width: 30)
                Text("%")
            }
            HStack {
                
                Circle().foregroundStyle(.purple)
                    .frame(width: 10, height: 10)
                
                Slider(value: $viewModel.value3, in: 0...100)
                    .frame(width: 300)
                
                Text(String(Int(viewModel.value3)))
                    .frame(width: 30)
                Text("%")
            }
//            HStack {
//                
//                Circle().foregroundStyle(.red)
//                    .frame(width: 10, height: 10)
//                
//                Slider(value: $viewModel.value4, in: 0...100)
//                    .frame(width: 300)
//                
//                Text(String(Int(viewModel.value4)))
//                    .frame(width: 30)
//                Text("%")
//            }
//            HStack {
//                
//                Circle().foregroundStyle(.cyan)
//                    .frame(width: 10, height: 10)
//                
//                Slider(value: $viewModel.value5, in: 0...100)
//                    .frame(width: 300)
//                
//                Text(String(Int(viewModel.value5)))
//                    .frame(width: 30)
//                Text("%")
//            }
//            HStack {
//                
//                Slider(value: $viewModel.value6, in: 0...100)
//                    .frame(width: 300)
//                
//                Text(String(Int(viewModel.value6)))
//            }
            
        }
    }
}
