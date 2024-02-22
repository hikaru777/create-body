//
//  ElementSliderView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/19.
//

import SwiftUI
import Charts

struct Element: Equatable {
    let name: String
    let count: Double
    let color: Color
}

struct ElementSliderView: View {
    
    @State var selectedData: Element = Element(name: "", count: 0, color: .black)
    
    @State var value: CGFloat = 50
    
    var allElement: [Element] {[
        Element(name: "酸素", count: 65, color: .blue),
        Element(name: "炭素", count: 18, color: .blue),
        Element(name: "水素", count: 10, color: .blue),
        Element(name: "窒素", count: 3, color: .blue),
        Element(name: "カルシウム", count: 1.5, color: .blue),
        Element(name: "リン", count: 1.0, color: .blue),
        Element(name: "少量元素", count: 0.9, color: .blue),
        Element(name: "微量元素", count: 0.6, color: .blue),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    var element: [Element] {[
        Element(name: "酸素", count: 65, color: .blue),
        Element(name: "炭素", count: 18, color: .green),
        Element(name: "水素", count: 10, color: .orange),
        Element(name: "窒素", count: 3, color: .purple),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    var element2: [Element] {[
        Element(name: "カルシウム", count: 1.5, color: .red),
        Element(name: "リン", count: 1.0, color: .cyan),
        Element(name: "少量元素", count: 0.9, color: .yellow),
        Element(name: "微量元素", count: 0.6, color: .blue),
        //        FavoriteFruit(name: "カリウム", count: viewModel.value6)
    ]}
    
    @State private var selectedCount: Int?
    
    @State private var selectedFruit: Element?
    
    var body: some View {
        
        HStack {
            
            VStack {
                
                Text("人体を構成するおおよその元素")
                    .font(.title)
                    .bold()
                
                Chart(allElement, id: \.name) { favoriteFruit in
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
                .frame(width: 400, height: 400)
                
                VStack {
                    
                    HStack {
                        
                        ForEach(element, id: \.name) { data in
                            
                            Button {
                                print(data.count)
                                withAnimation {
                                    selectedData = data
                                }
                            } label: {
                                Text(data.name)
                                    .foregroundStyle(.black)
                            }
                            .frame(width: 100, height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(data.color, lineWidth: 2)
                            )
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        }
                    }
                    
                    HStack {
                        
                        ForEach(element2, id: \.name) { data in
                            
                            Button {
                                print(data.count)
                                withAnimation {
                                    selectedData = data
                                }
                            } label: {
                                Text(data.name)
                                    .foregroundStyle(.black)
                            }
                            .frame(width: 100, height: 70)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(data.color, lineWidth: 2)
                            )
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        }
                    }
                    
                }
                .padding(.top, 40)
            }
            
            
            
            if selectedData.name == "" {
                
            } else if selectedData.name == "酸素" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("水分子 (H2O) - 人体の水分の主要成分。\n二酸化炭素 (CO2) - 呼吸によって生成され、体外に排出される。\n有機化合物の酸素原子の一部として、例えばタンパク質や脂質など。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "炭素" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("有機化合物の基本構造の一部で、炭水化物、脂質、タンパク質などの主要な栄養素。\n生体分子の骨格として機能し、生命活動の基盤となる。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "水素" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("水分子 (H2O) の構成要素として、人体の水分の主要成分。\n有機化合物の水素原子の一部として、例えばタンパク質や脂質など。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "窒素" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("アミノ酸の構成要素で、タンパク質の主要な構成要素。\n生体分子の一部として、例えばDNAやRNAなどの核酸。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "カルシウム" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("骨や歯の主要な構成要素で、骨格の強度と硬度を保持する。\n筋肉の収縮や神経の伝達などの生理機能に関与。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "リン" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("骨や歯の主要な構成要素で、カルシウムと共に骨格の形成と維持に関与。\nATPなどの生体内でのエネルギー伝達に関与するリン酸化合物の一部。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "少量元素" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("少量元素は、人体内で比較的多く存在し、体重の1グラム以上を占める元素です。\nこれらの元素は、カルシウム、リン、カリウム、ナトリウム、マグネシウムなどを含みます。\n少量元素は、骨格や細胞構造、生理機能などの重要な役割を果たします。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            } else if selectedData.name == "微量元素" {
                
                Spacer()
                
                ZStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading) {
                            
                            Text("割合")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("\(String(format: "%.1f", selectedData.count))%")
                                .font(.title)
                            
                        }
                        .padding(30)
                     
                        VStack(alignment: .leading) {
                            
                            Text("主な反応、働き")
                                .font(.body)
                                .foregroundStyle(.gray)
                            
                            Text("微量元素は、人体内でわずかしか存在せず、体重の1グラム未満を占める元素です。\nこれらの元素は、亜鉛、銅、鉄、セレン、ヨウ素などを含みます。\n微量元素は、酵素の補因子やホルモンの合成、免疫機能の維持など、生体内でさまざまな役割を果たします。")
                                .font(.headline)
                            
                        }
                        .padding(30)
                        .padding(.bottom, 20)
                    }
                        
                    HStack {
                        
                        VStack {
                            Text(selectedData.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .padding()
                            Spacer()
                        }
                        
                        Spacer()
                        VStack {
                            Button {
                                withAnimation {
                                    selectedData = Element(name: "", count: 0, color: .black)
                                }
                            } label: {
                                Image(systemName: "x.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                            }
                            .padding()
                            Spacer()
                        }
                    }
                    
                }
                .frame(width: 400, height: 600)
                .background(.ultraThinMaterial)
                .cornerRadius(15)
                
            }
            
        }
    }
}

