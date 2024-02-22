//
//  ElementView.swift
//  InformationTransferabilitySimulation
//
//  Created by 本田輝 on 2024/02/18.
//

import SwiftUI
import SpriteKit
import Charts

struct ElementView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            
            // 画面全体に雨を降らせたいので GeometryReader で画面サイズを取得する
            GeometryReader { geometry in
                SpriteView(
                    // SafeArea 外にも雨を降らせたいので、SafeArea も含めたサイズを指定する
                    scene: self.createRainParticleScene(size: geometry.sizeWithSafeArea),
                    // 背景を透過させる場合に、設定が必要である
                    options: [.allowsTransparency]
                ).edgesIgnoringSafeArea(.all)
                SpriteView(
                    // SafeArea 外にも雨を降らせたいので、SafeArea も含めたサイズを指定する
                    scene: self.createCellParticleScene(size: geometry.sizeWithSafeArea),
                    // 背景を透過させる場合に、設定が必要である
                    options: [.allowsTransparency]
                ).edgesIgnoringSafeArea(.all)
                SpriteView(
                    // SafeArea 外にも雨を降らせたいので、SafeArea も含めたサイズを指定する
                    scene: self.createParticleScene(size: geometry.sizeWithSafeArea),
                    // 背景を透過させる場合に、設定が必要である
                    options: [.allowsTransparency]
                ).edgesIgnoringSafeArea(.all)
                SpriteView(
                    // SafeArea 外にも雨を降らせたいので、SafeArea も含めたサイズを指定する
                    scene: self.createOParticleScene(size: geometry.sizeWithSafeArea),
                    // 背景を透過させる場合に、設定が必要である
                    options: [.allowsTransparency]
                ).edgesIgnoringSafeArea(.all)
                
            }
            
            ElementSliderView()
            .frame(width: 900, height: 600)
            .padding(50)
            .background(.ultraThinMaterial.opacity(0.9))
            .cornerRadius(15)
            
        }
    }
    
    private func createRainParticleScene(size: CGSize) -> SKScene {
        let emitterNode = SKEmitterNode(fileNamed: "CellParticle1")!
        let scene = SKScene(size: size)
        scene.addChild(emitterNode)
        // 背景を透過させる
        scene.backgroundColor = .clear
        // 右上から雨を降らせたい
        scene.anchorPoint = .init(x: 0.5, y: 1.2)
        
        return scene
    }
    
    private func createCellParticleScene(size: CGSize) -> SKScene {
        let emitterNode = SKEmitterNode(fileNamed: "CellParticle1")!
        emitterNode.particleColor = .green
        emitterNode.particleBirthRate = 100
        let scene = SKScene(size: size)
        scene.addChild(emitterNode)
        // 背景を透過させる
        scene.backgroundColor = .clear
        // 右上から雨を降らせたい
        scene.anchorPoint = .init(x: 1.3, y: 0.5)
        
        return scene
    }
    private func createParticleScene(size: CGSize) -> SKScene {
        let emitterNode = SKEmitterNode(fileNamed: "CellParticle1")!
        emitterNode.particleColor = .red
        emitterNode.particleBirthRate = 200
        let scene = SKScene(size: size)
        scene.addChild(emitterNode)
        // 背景を透過させる
        scene.backgroundColor = .clear
        // 右上から雨を降らせたい
        scene.anchorPoint = .init(x: -0.3, y: 0.5)
        
        return scene
    }
    private func createOParticleScene(size: CGSize) -> SKScene {
        let emitterNode = SKEmitterNode(fileNamed: "CellParticle1")!
        emitterNode.particleColor = .orange
        emitterNode.particleBirthRate = 300
        let scene = SKScene(size: size)
        scene.addChild(emitterNode)
        // 背景を透過させる
        scene.backgroundColor = .clear
        // 右上から雨を降らせたい
        scene.anchorPoint = .init(x: 0.5, y: -0.2)
        
        return scene
    }
}

private extension GeometryProxy {
    
    /// SafeArea も含めたサイズ
    /// - Note: 画面全体のサイズを取得するときに利用すること
    var sizeWithSafeArea: CGSize {
        .init(
            width: self.size.width + self.safeAreaInsets.trailing + self.safeAreaInsets.leading,
            height: self.size.height + self.safeAreaInsets.top + self.safeAreaInsets.bottom
        )
    }
}
