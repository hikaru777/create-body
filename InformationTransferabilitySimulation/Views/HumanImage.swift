//
//  HumanImage.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/16.
//

import SwiftUI

struct HumanImage: View {
    @ObservedObject var viewModel: viewModel
    var body: some View {
        
        VStack(spacing: -10) {
            Path(ellipseIn: CGRect(x:0, y: 0, width: 140, height: 140))
                .fill(viewModel.color)
                .frame(width: 140, height: 140)
            
            HStack(spacing: 3) {
                
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                        .fill(viewModel.color)
                        .frame(width: CGFloat(viewModel.roundWeight), height: 120)
                        .rotationEffect(.degrees(20))
                        .padding(.bottom, 60)
                
                Path(ellipseIn: CGRect(x:0, y: 0, width: CGFloat(viewModel.weight), height: 200))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.weight), height: 200)
                    .padding(.bottom, 25)
                
                    Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                        .fill(viewModel.color)
                        .frame(width: CGFloat(viewModel.roundWeight), height: 120)
                        .rotationEffect(.degrees(160))
                        .padding(.bottom, 60)
                
            }
            
            HStack(spacing: 10) {
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.roundWeight), height: 120)
                Path(ellipseIn: CGRect(x:0, y: 0, width: viewModel.roundWeight, height: 120))
                    .fill(viewModel.color)
                    .frame(width: CGFloat(viewModel.roundWeight), height: 120)
            }
            .padding(.top, -20)
            
        }
    }
}

