//
//  TempleView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct TempleView: View {
    @EnvironmentObject var scene:GameScene
    @State var stockItems:[Item] = []
    func populate(){
        stockItems.append(Item(nType: ItemType.MAXH, nPrice: 20, nPower: 0))
        stockItems.append(Item(nType: ItemType.FULLH, nPrice: 20, nPower: 0))
        stockItems.append(Item(nType: ItemType.SLOT, nPrice: 20, nPower: 0))
    }
    func buy(_ item: Item){
        if scene.xp < item.price {
            return
        }
        switch(item.type){
        case .MAXH:
            if scene.maxHealth < 6 {
                scene.maxHealth += 1
                scene.health += 1
                scene.xp -= item.price
                item.empty()
            }
        case .FULLH:
            scene.health = scene.maxHealth
            scene.xp -= item.price
            item.empty()
        default:
            scene.increaseInventory()
            scene.xp -= item.price
            item.empty()
        }
    }
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
            .ignoresSafeArea()
            ZStack{
                Image("ImageBGTemple")
                    .resizable()
                    .scaledToFit()
                Image("ImageKeyTemple")
                    .resizable()
                    .scaledToFit()
            }
            VStack{
                UIPill(style: ShopStyle.Temple)
                Spacer()
                Spacer()
                HStack{
                    ForEach(stockItems){ item in
                        VStack{
                            ZStack {
                                Image("ICON_ENTITY_EMPTY")
                                    .resizable()
                                    .padding(6)
                                item.sprite
                                    .resizable()
                                    .padding(6)
                                    .onTapGesture {
                                        buy(item)
                                    }
                                HStack{
                                    Spacer()
                                    VStack{
                                        Spacer()
                                        if item.power != 0{
                                            Image("num_\(item.power)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 32)
                                                .padding(20)
                                        }
                                    }
                                }
                            }
                            .scaledToFit()
                            HStack{
                                if item.sprite != Image("ICON_ENTITY_EMPTY"){
                                    Image("ICON_UI_XP")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                    Text("\(item.price)")
                                        .foregroundColor(Color.ui.textGreen)
                                        .font(.system(size: 24, weight: .heavy, design: .rounded))
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear{
            populate()
        }
    }
}

struct TempleView_Previews: PreviewProvider {
    static var previews: some View {
        TempleView()
            .environmentObject(GameScene())
    }
}
