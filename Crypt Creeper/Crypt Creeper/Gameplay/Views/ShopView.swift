//
//  ShopView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct ShopView: View {
    //@ObservedObject var vm: ShopViewModel = ShopViewModel()
    @EnvironmentObject var scene:GameScene
    @State var stockItems:[Item] = []
    
    func populate(){
        while(stockItems.count < 3){
            let chance = Int.random(in: 1...100)
            let power = Int.random(in: 2...5)
            if chance <= 30 {
                stockItems.append(Item(nType: ItemType.SWORD, nPrice: power*2, nPower: power))
            } else if chance <= 60 {
                stockItems.append(Item(nType: ItemType.SHIELD, nPrice: power*2, nPower: power))
            } else if chance <= 80 {
                stockItems.append(Item(nType: ItemType.POTION, nPrice: power*2, nPower: power))
            } else {
                let specialType = Int.random(in: 1...3)
                switch(specialType){
                case 1: stockItems.append(Item(nType: ItemType.GREENP, nPrice: 20, nPower: 0))
                case 2: stockItems.append(Item(nType: ItemType.RERROLL, nPrice: 20, nPower: 0))
                case 3: stockItems.append(Item(nType: ItemType.BOMB, nPrice: 20, nPower: 0))
                default: stockItems.append(Item(nType: ItemType.BOMB, nPrice: 20, nPower: 0))
                }
            }
        }
    }
    
    func buy(_ item: Item){
        if scene.coins < item.price {
            return
        }
        var success = false
        for invitem in scene.inventorySlots {
            if !success {
                if invitem.type == ItemType.NONE {
                    invitem.type = item.type
                    invitem.sprite = item.sprite
                    invitem.power = item.power
                    scene.coins -= item.price
                    item.empty()
                    success = true
                }
            }
        }
        if success {
            return
        }
        switch(item.type){
        case .SWORD:
            scene.swordPower = item.power
            scene.coins -= item.price
            item.empty()
        case .SHIELD:
            scene.shieldPower = item.power
            scene.coins -= item.price
            item.empty()
        case .POTION:
            scene.heal(amount: item.power)
            scene.coins -= item.price
            item.empty()
        default: break
        }
    }

    var body: some View {
        VStack{
            UIPill(style: ShopStyle.Shop)
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
                                Image("ICON_UI_COIN")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("\(item.price)")
                                    .foregroundColor(Color.ui.textYellow)
                                    .font(.system(size: 24, weight: .heavy, design: .rounded))
                            }
                        }
                    }
                }
            }
            List {
                ForEach (stockItems){ item in
                    HStack{
                        item.sprite
                          .resizable()
                          .frame(width: 20, height: 20)
                        if item.type != ItemType.NONE{
                            Text("price: \(item.price)")
                        } else {
                            Text("NOTHING")
                        }
                        
                    }
                    .onTapGesture {
                        item.empty()
                    }
                    
                }
            }
        }
        .onAppear{
            populate()
        }
        
    }
    
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
                .environmentObject(GameScene())
        }
    }
}
