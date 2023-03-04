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
enum EntityType: CaseIterable{
    case Empty
    case Player
    case Portal
    case Enemy
    case Sword
    case Shield
    case Potion
    case Coin
    case Shop
    case Temple
    case Boss
}
class Tile: SKSpriteNode, Identifiable{
    var type:EntityType = EntityType.Empty
    var power:Int = 0
    var x:Int = 0
    var y:Int = 0
}
//MARK: - View
struct ContentView: View {
    
    @StateObject var scene: GameScene = {
        let scene = GameScene()
        scene.size = CGSize(width: 100, height: 100)
        scene.scaleMode = .aspectFit
        scene.backgroundColor = UIColor(named: "ColorGameBackground")!
        return scene
    }()
    
    @State var showGameOver:Bool = false
    @State var showWin:Bool = false
    
    var shieldImage:String {
        return "ICON_SHIELD_\(scene.shieldPower)"
    }
    var swordImage: String {
        return "ICON_SWORD_\(scene.swordPower)"
    }
    
    var body: some View {
        ZStack{
            GeometryReader { geo in
                ZStack{
                    VStack{
                        Color.ui.gameBackground
                        Color.ui.UIBackground
                    }
                    
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text("\(scene.score)")
                                .foregroundColor(Color.ui.text)
                        }
                        SpriteView(scene: scene)
                            .frame(width: geo.size.width, height: geo.size.width)
                            .border(Color.ui.gameBackground)
                        HStack{
                            Image("ICON_UI_HEALTH")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.leading, 6)
                            Text(": \(scene.health) / \(scene.maxHealth)")
                                .foregroundColor(Color.ui.text)
                            Rectangle()
                                .foregroundColor(.red)
                                .frame(width: 90, height: 20)
                                .onTapGesture {
                                    scene.xp = 80
                                    scene.showTemple = true
                                }
                            Spacer()
                            Text("LVL: \(scene.level)")
                                .foregroundColor(Color.ui.text)
                                .padding(.trailing, 6)
                        }
                        HStack{
                            ZStack{
                                Image("ICON_ENTITY_EMPTY")
                                    .resizable()
                                    .frame(width:80, height: 80)
                                Image("\(swordImage)")
                                    .resizable()
                                    .frame(width:80, height: 80)
                                    .onTapGesture {
                                        scene.saveSword()
                                    }
                                HStack{
                                    Spacer()
                                    VStack{
                                        Spacer()
                                        if scene.swordPower != 0{
                                            Image("num_\(scene.swordPower)")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .padding(6)
                                        }
                                    }
                                    
                                }
                                
                            }
                            .frame(width: 80, height: 80)
                            ZStack{
                                Image("ICON_ENTITY_EMPTY")
                                    .resizable()
                                    .frame(width:80, height: 80)
                                Image("\(shieldImage)")
                                    .resizable()
                                    .frame(width:80, height: 80)
                                    .onTapGesture {
                                        scene.saveShield()
                                    }
                                HStack{
                                    Spacer()
                                    VStack{
                                        Spacer()
                                        if scene.shieldPower != 0{
                                            Image("num_\(scene.shieldPower)")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .padding(6)
                                        }
                                    }
                                    
                                }
                                
                            }
                            .frame(width: 80, height: 80)
                            Spacer()
                            ForEach (scene.inventorySlots) {item in
                                ZStack{
                                    Image("ICON_ENTITY_EMPTY")
                                        .resizable()
                                        .frame(width:80, height: 80)
                                    item.sprite
                                        .resizable()
                                        .frame(width:80, height: 80)
                                        .onTapGesture {
                                            scene.useItem(item: item)
                                        }
                                    HStack{
                                        Spacer()
                                        VStack{
                                            Spacer()
                                            if item.power != 0 {
                                                Image("num_\(item.power)")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .padding(6)
                                            }
                                        }
                                    }
                                    
                                }
                                .frame(width: 80, height: 80)
                            }
                        }
                        HStack{
                            Image("ICON_UI_COIN")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.leading, 6)
                            Text(": \(scene.coins)")
                                .foregroundColor(Color.ui.textYellow)
                            Spacer()
                            Image("ICON_UI_XP")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(": \(scene.xp)")
                                .foregroundColor(Color.ui.textGreen)
                                .padding(.trailing, 6)
                            
                        }
                        Spacer()
                    }
                }
                .ignoresSafeArea() //Navigation
                .sheet(isPresented: $scene.showShop) {
                    ShopView()
                }
                .sheet(isPresented: $scene.showTemple) {
                    TempleView()
                }
                ZStack{
                    NavigationLink(isActive: $scene.showWin) {
                        WinView(score: scene.score, scene: scene)
                    } label: {
                        EmptyView()
                    }
                    NavigationLink(isActive: $scene.showGameOver) {
                        GameOverView(score: scene.score, scene: scene)
                    } label: {
                        EmptyView()
                    }

                }
                .hidden()
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .environmentObject(scene)
    }
}
