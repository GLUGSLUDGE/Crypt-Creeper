//
//  ContentView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 9/1/23.
//

import SwiftUI
import SpriteKit

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class GameScene: SKScene, ObservableObject {
    @Published var coins:String = "19"
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let box = SKSpriteNode(color: .red, size: CGSize(width: 10, height: 10))
        box.position = location
        createGrid()
        
        addChild(box)
    }
    
    func createGrid(){
        coins = "IT IS WORKING"
        let startX = CGFloat(17)
        let startY = CGFloat(17)
        var x, y: CGFloat
        for i in 1...5{
            x = (startX*CGFloat(i))
            for j in 1...5{
                y = (startY*CGFloat(j))
                let box = SKSpriteNode(color: .red, size: CGSize(width: 10, height: 10))
                box.position = CGPoint(x: x, y: y)
                addChild(box)
            }
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var scene: GameScene = {
        let scene = GameScene()
        scene.size = CGSize(width: 100, height: 100)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = .blue
        return scene
    }()


    var body: some View {
        ZStack(){
            GeometryReader { geo in
                ZStack{
                    Color.gray
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text("SCORE")
                        }
                        SpriteView(scene: scene)
                            .frame(width: geo.size.width, height: geo.size.width)
                            .border(Color.green)
                        HStack{
                            Text("HEALTH")
                            Spacer()
                            Text("LEVEL")
                        }
                        HStack{
                            Rectangle()
                                .frame(width:100, height: 100)
                            Rectangle()
                                .frame(width:100, height: 100)
                            Spacer()
                        }
                        HStack{
                            Text(scene.coins)
                            Spacer()
                        }
                        Spacer()
                        Button("Create Grid") {
                            scene.createGrid()
                        }.padding(20)
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}
