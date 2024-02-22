//
//  ContentView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/16.
//

import SwiftUI
import Charts

struct FavoriteFruit: Equatable {
    let name: String
    let count: Double
}

struct ContentView: View {
    
    @State var weight = 130
    
    @State var color: Color = .yellow
    
    @State var opacity: Double = 0
    
    @State var graphOpacity: Double = 1
    
    @ObservedObject var viewModel: viewModel
    
    @State var isPresented = false
    
    @State var showElementView = false
    
    @State var elementViewOpacity: Double = 0
    
    @State var showDrawView = 0
    
    var favoriteFruits: [FavoriteFruit] {[
        FavoriteFruit(name: "water", count: viewModel.value0),
        FavoriteFruit(name: "protein", count: viewModel.value1),
        FavoriteFruit(name: "carbohydrates", count: viewModel.value2),
        FavoriteFruit(name: "lipid", count: viewModel.value3),
        FavoriteFruit(name: "other substances", count: 5),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    @State private var selectedCount: Int?
    
    @State private var selectedFruit: FavoriteFruit?
    
    var body: some View {
        
        ZStack {
            
            HStack {
                Spacer()
                
            }
            .padding(.top, 10)
            .padding(.leading, 30)
            
            HStack() {
                
                Spacer()
                
                VStack(spacing: 70) {
                        BlockTextAnimation(text: "この体を目指して要素を構成してみよう！",
                                           font: .custom("Avenir-Black", size: 21),
                                           startTime: 1.0)
                        .opacity(isPresented ? 0 : 1)
                    
                    HumanImage(viewModel: viewModel)
                    
                }
                .padding(.bottom, 80)
                
                Spacer()
                
                VStack(spacing: 20) {
                    
                    if isPresented {
                        
                        if !viewModel.problemArray.isEmpty {
                            
                            ZStack {
                                
                                ChartView(viewModel: viewModel, isPresented: $isPresented)
                                    .frame(width: 500, height: 600)
                                    .opacity(self.opacity)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(15)
                                    .onAppear {
                                        withAnimation(.linear(duration: 0.3)) {
                                            // NOTE: opacityを変更する画面再描画に対してアニメーションを適用する
                                            graphOpacity = 0
                                            self.opacity = 1.0
                                        }
                                    }
                                    .onDisappear {
                                        withAnimation {
                                            self.opacity = 0
                                            graphOpacity = 1
                                            viewModel.weight = 130
                                            viewModel.roundWeight = 70
                                            viewModel.color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                                        }
                                    }
                                
                            }
                            
                        } else {
                            
                            
                            Text("Grate!")
                                .frame(width: 500, height: 600)
                                .opacity(self.opacity)
                                .background(.ultraThinMaterial)
                                .cornerRadius(15)
                                .onAppear {
                                    withAnimation(.linear(duration: 0.3)) {
                                        // NOTE: opacityを変更する画面再描画に対してアニメーションを適用する
                                        graphOpacity = 0
                                        self.opacity = 1.0
                                    }
                                }
                                .onDisappear {
                                    withAnimation {
                                        self.opacity = 0
                                        graphOpacity = 1
                                        viewModel.weight = 130
                                        viewModel.roundWeight = 70
                                        viewModel.color = Color(red: 255/255, green: 218/255, blue: 185/255, opacity: 1)
                                    }
                                }
                            
                        }
                        
                    } else {
                        
                        VStack {
                            
                            VStack() {
                                
                                ZStack {
                                    
                                    if let selectedFruit = selectedFruit {
                                        
                                        Text(String(format: "%.1f", selectedFruit.count))
                                        
                                    }
                                    
                                    Chart(favoriteFruits, id: \.name) { favoriteFruit in
                                        SectorMark(
                                            angle: .value("count", favoriteFruit.count),
                                            innerRadius: .inset(50),
                                            outerRadius: selectedFruit == favoriteFruit ? .automatic : .inset(10),
                                            angularInset: 3.0
                                        )
                                        .foregroundStyle(by: .value("name", favoriteFruit.name))
                                        .opacity(selectedFruit == nil ? 1.0 : selectedFruit == favoriteFruit ? 1.0 : 0.5)
                                    }
                                    .chartAngleSelection(value: $selectedCount)
                                    
                                    .frame(width: 350, height: 350)
                                }
                                .padding(.bottom, 50)
                                
                                SliderView(viewModel: viewModel)
                                
                            }
                            .frame(width: 500, height: 600)
                            .opacity(graphOpacity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                        }
                    }
                 
                    Button {
                        viewModel.problemArray.removeAll()
                        
                        viewModel.changeValue()
                        
                        self.isPresented.toggle()
                    } label: {
                        Text(isPresented ? "remake body" : "create body from those elements")
                            .foregroundStyle(.black)
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.blue, lineWidth: 2)
                    )
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                    .padding(.top)
                    
                }
            }
            .padding(.trailing, 100)
            
            ZStack {
                
                ElementView()
                    .background(.white)
                    .opacity(elementViewOpacity)
                
                HStack {
                    Spacer()
                    VStack {
                        Button {
                            withAnimation {
                                if elementViewOpacity == 1 {
                                    elementViewOpacity = 0
                                } else {
                                    elementViewOpacity = 1
                                }
                            }
                        } label: {
                            Image(systemName: elementViewOpacity == 1 ? "questionmark.circle.fill" : "questionmark.circle")
                                .resizable()
                        }
                        .frame(width: 50, height: 50)
                        Spacer()
                    }
                }
                .padding()
                
            }
            
            PenKitView()
            .frame(width: 400, height: 400)
            .padding(50)
            .background(.ultraThinMaterial.opacity(0.9))
            .cornerRadius(15)
            .opacity(Double(showDrawView))
            
            HStack {
                VStack {
                    Button {
//                        withAnimation {
                            if showDrawView == 1 {
                                showDrawView = 0
                            } else {
                                showDrawView = 1
                            }
//                        }
                    } label: {
                        Image(systemName: showDrawView == 1 ? "pencil.circle.fill" : "pencil.circle")
                            .resizable()
                    }
                    .frame(width: 50, height: 50)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            
        }
    }
}
