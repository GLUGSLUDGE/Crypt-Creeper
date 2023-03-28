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
    
    private var shieldImage:String {
        return "ICON_SHIELD_\(scene.shieldPower)"
    }
    private var swordImage: String {
        return "ICON_SWORD_\(scene.swordPower)"
    }
    private var slotSize: CGFloat {
        return UIScreen.main.bounds.width / 6
    }
    private var uiLevel:String {
        return (scene.level < 10) ? "0\(scene.level)" : "\(scene.level)"
    }
    private var uiScore:String {
        if scene.score < 1 {
            return "00000\(scene.score)"
        }
        if scene.score < 10 {
            return "00000\(scene.score)"
        }
        if scene.score < 100 {
            return "0000\(scene.score)"
        }
        if scene.score < 1000 {
            return "000\(scene.score)"
        }
        if scene.score < 10000 {
            return "00\(scene.score)"
        }
        if scene.score < 100000 {
            return "0\(scene.score)"
        }
        return "\(scene.score)"
    }
    private var uiXP:String{
        if scene.xp < 1 {
            return "000\(scene.xp)"
        }
        if scene.xp < 10 {
            return "00\(scene.xp)"
        }
        if scene.xp < 100 {
            return "0\(scene.xp)"
        }
        return "\(scene.xp)"
    }
    private var healthBarPC:Float{
        if scene.health == 0 {
            return 0
        }
        return (Float(scene.health) / Float(scene.maxHealth))
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
                            Text("\(uiScore)")
                                .foregroundColor(Color.ui.text)
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                        }
                        .padding(.horizontal, 12)
                        SpriteView(scene: scene)
                            .frame(width: geo.size.width, height: geo.size.width)
                            .border(Color.ui.gameBackground)
                        HStack{
                            Image("ICON_UI_HEALTH")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(": \(scene.health) / \(scene.maxHealth)")
                                .foregroundColor(Color.ui.text)
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: 75, height: 20)
                                HStack{
                                    Rectangle()
                                        .frame(width: CGFloat(90*healthBarPC), height: 20)
                                        .foregroundColor(.red)
                                        .border(.white)
                                    Spacer()
                                }
                            }
                            .frame(width: 90, height: 20, alignment: .center)
                            .onTapGesture {
                                scene.increaseInventory()
                                scene.showShop = true
                                scene.coins = 100
                            }
                            Spacer()
                            Text("LVL: \(uiLevel)")
                                .foregroundColor(Color.ui.text)
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                        }
                        .padding(.horizontal, 12)
                        HStack{
                            ZStack{
                                Image("ICON_ENTITY_EMPTY")
                                    .resizable()
                                    .frame(width:slotSize, height: slotSize)
                                Image("\(swordImage)")
                                    .resizable()
                                    .frame(width:slotSize, height: slotSize)
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
                            .frame(width:slotSize, height: slotSize)
                            ZStack{
                                Image("ICON_ENTITY_EMPTY")
                                    .resizable()
                                    .frame(width:slotSize, height: slotSize)
                                Image("\(shieldImage)")
                                    .resizable()
                                    .frame(width:slotSize, height: slotSize)
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
                            .frame(width:slotSize, height: slotSize)
                            Spacer()
                            ForEach (scene.inventorySlots) {item in
                                ZStack{
                                    Image("ICON_ENTITY_EMPTY")
                                        .resizable()
                                        .frame(width:slotSize, height: slotSize)
                                    item.sprite
                                        .resizable()
                                        .frame(width:slotSize, height: slotSize)
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
                                .frame(width:slotSize, height: slotSize)
                            }
                        }
                        .padding(.horizontal, 12)
                        HStack{
                            Image("ICON_UI_COIN")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(": \(scene.coins)")
                                .foregroundColor(Color.ui.textYellow)
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                            Spacer()
                            Image("ICON_UI_XP")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text(": \(uiXP)")
                                .foregroundColor(Color.ui.textGreen)
                                .font(.system(size: 18, weight: .heavy, design: .rounded))
                            
                            
                        }
                        .padding(.horizontal, 12)
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
                        WinView(currentScore: scene.score, scene: scene)
                    } label: {
                        EmptyView()
                    }
                    NavigationLink(isActive: $scene.showGameOver) {
                        GameOverView(currentScore: scene.score, scene: scene)
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
