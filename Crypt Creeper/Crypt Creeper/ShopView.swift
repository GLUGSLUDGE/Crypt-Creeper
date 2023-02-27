//
//  ShopView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct ShopView: View {
    @ObservedObject var vm = ShopViewModel()
    @ObservedObject var scene:GameScene
    
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
            .ignoresSafeArea()
            ZStack{
                Image("ImageBGShop01")
                    .resizable()
                    .scaledToFit()
                Image("ImageBGShop02")
                    .resizable()
                    .scaledToFit()
                Image("ImageKeyShop")
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.ui.colorBGRed)
            VStack{
                UIPill(scene: scene, style: ShopStyle.Shop)
                Spacer()
                Spacer()
                ZStack{
                    HStack{
                        Image("ICON_ENTITY_EMPTY")
                            .resizable()
                            .scaledToFit()
                        Image("ICON_ENTITY_EMPTY")
                            .resizable()
                            .scaledToFit()
                        Image("ICON_ENTITY_EMPTY")
                            .resizable()
                            .scaledToFit()
                    }
                    HStack{
                        ForEach(vm.stockItems){ item in
                            VStack{
                                ZStack{
                                    item.sprite
                                        .resizable()
                                        .padding(6)
                                    HStack{
                                        Spacer()
                                        VStack{
                                            Spacer()
                                            Image("num_\(item.power)")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 32)
                                                .padding(20)
                                        }
                                    }
                                }
                                .scaledToFit()
                                
                                HStack{
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
                Spacer()
            }
            .onAppear {
                vm.populate()
            }
            
            
        }
    }

}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(scene: GameScene())
    }
}
enum ItemType: CaseIterable{
    case SWORD
    case SHIELD
    case POTION
    case GREENP
    case RERROLL
    case BOMB
}
class Item: Identifiable{
    
    init(nType:ItemType, nPrice:Int, nPower:Int) {
        type = nType
        power = Int.random(in: 3...5)
        price = 3*power
        switch type {
        case ItemType.SWORD:
            sprite = Image("ICON_SWORD_\(power)")
        case ItemType.SHIELD:
            sprite = Image("ICON_SHIELD_\(power)")
        case ItemType.POTION:
            sprite = Image("ICON_POTION_\(power)")
        case ItemType.GREENP:
            sprite = Image("ICON_C_GREENP")
        case ItemType.RERROLL:
            sprite = Image("ICON_C_RERROLL")
        case ItemType.BOMB:
            sprite = Image("ICON_C_BOMB")
        }
    }
    
    var type:ItemType
    var price:Int
    var power:Int
    var sprite:Image
}
class ShopViewModel: ObservableObject{
    @Published var stockItems:[Item] = []
    
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
}
